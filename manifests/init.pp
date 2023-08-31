# pe_nc_backup
#
# Main entry point to pe_nc_backup
#
# @summary Creates backups of Puppet Enterprise's Node Classifier as json in a git repo.
#
# @example
#   include pe_nc_backup
#
# @param path path to directory to store the backup git repo, backup script, and log file.
#   The parent directory must already exist.
# @param ssl_dir The path to the Puppet Agent's ssl directory on the PE primary server.
# @param log_level The verbosity of the Ruby logger writing to the log file. Possible values: 'debug',
#   'info', 'warn', 'error', 'fatal'.
# @param log_level_stdout The verbosity of the Ruby logger writing to STDOUT. Possible values: 'debug',
#   'info', 'warn', 'error', 'fatal'.
# @param stdout_log Whether to enable the STDOUT logger.
# @param cron_hour The hour for the cron job.
# @param cron_minute The minute for the cron job.
#
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

  file {
    default:
      owner => 'pe-puppet',
      group => 'pe-puppet',
      mode  => '0644',
    ;
    [$path, $bin_dir]:
      ensure => directory,
    ;
    'pe_nc_backup script':
      ensure  => file,
      path    => "${bin_dir}/pe_nc_backup",
      mode    => '0755',
      content => epp('pe_nc_backup/pe_nc_backup.epp', {
        ssl_dir          => $ssl_dir,
        log_level        => $log_level,
        log_level_stdout => $log_level_stdout,
        stdout_log       => $stdout_log,
      })
    ;
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

  # sudo -H -u pe-puppet /opt/puppetlabs/puppet/bin/ncio backup > /var/tmp/backup.json
  cron { 'pe_nc_backup':
    command => "${bin_dir}/pe_nc_backup ${path}",
    user    => 'pe-puppet',
    hour    => $cron_hour,
    minute  => $cron_minute,
    require => [File['pe_nc_backup script'], Package['ncio'], Vcsrepo[$git_repo_dir],],
  }
}
