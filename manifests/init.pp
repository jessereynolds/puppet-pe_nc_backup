# pe_nc_backup
#
# Main entry point to pe_nc_backup
#
# @summary Creates backups of Puppet Enterprise's Node Classifier as json in a git repo.
#
# @example
#   include pe_nc_backup
class pe_nc_backup (
  String $path    = '/opt/pe_nc_backup',
  String $ssl_dir = '/etc/puppetlabs/puppet/ssl',
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
    content => epp('pe_nc_backup/pe_nc_backup.epp', { ssl_dir => $ssl_dir })
  }

  # sudo -H -u pe-puppet /opt/puppetlabs/puppet/bin/ncio backup > /var/tmp/backup.json
  cron { 'pe_nc_backup':
    command => "${bin_dir}/pe_nc_backup ${path}",
    user    => 'pe-puppet',
    hour    => '*',
    minute  => '*/5',
    require => [ File['pe_nc_backup script'], Package['ncio'], Vcsrepo[$git_repo_dir], ],
  }

}

