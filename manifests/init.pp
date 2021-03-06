# pe_nc_backup
#
# Main entry point to pe_nc_backup
#
# @summary Creates backups of Puppet Enterprise's Node Classifier as json in a git repo.
#
# @example
#   include pe_nc_backup
class pe_nc_backup (
  String                                          $path             = '/opt/pe_nc_backup',
  String                                          $ssl_dir          = '/etc/puppetlabs/puppet/ssl',
  Enum['debug', 'info', 'warn', 'error', 'fatal'] $log_level        = 'info',
  Enum['debug', 'info', 'warn', 'error', 'fatal'] $log_level_stdout = 'error',
  Boolean                                         $stdout_log       = true,
  String                                          $cron_hour        = '*',
  String                                          $cron_minute      = '*/5',
) {

  $git_repo_dir = "${path}/repo"
  $bin_dir      = "${path}/bin"

  File {
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
    mode   => '0644',
  }

  file { $path:
    ensure => directory,
  }

  vcsrepo { $git_repo_dir:
    ensure   => present,
    provider => git,
    user     => 'pe-puppet',
    require  => File[$path],
  }

  package { 'ncio':
    ensure   => installed,
    provider => puppet_gem,
  }

  file { $bin_dir:
    ensure => directory,
  }

  file { 'pe_nc_backup script':
    ensure  => file,
    path    => "${bin_dir}/pe_nc_backup",
    mode    => '0755',
    content => epp('pe_nc_backup/pe_nc_backup.epp', {
      ssl_dir          => $ssl_dir,
      log_level        => $log_level,
      log_level_stdout => $log_level_stdout,
      stdout_log       => $stdout_log,
    })
  }

  # sudo -H -u pe-puppet /opt/puppetlabs/puppet/bin/ncio backup > /var/tmp/backup.json
  cron { 'pe_nc_backup':
    command => "${bin_dir}/pe_nc_backup ${path}",
    user    => 'pe-puppet',
    hour    => $cron_hour,
    minute  => $cron_minute,
    require => [ File['pe_nc_backup script'], Package['ncio'], Vcsrepo[$git_repo_dir], ],
  }

}

