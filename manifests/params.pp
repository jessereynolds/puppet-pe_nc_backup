# pe_nc_backup::params
#
# Parameter defaults
#
# @summary Parameter defaults for pe_nc_backup
#
# @example
#   inherits pe_nc_backup::params
class pe_nc_backup::params {
  $path         = '/opt/pe_nc_backup'
  $git_repo_dir = "${path}/repo"
  $bin_dir      = "${path}/bin"
  $ssl_dir      = $facts['puppet_ssldir']
}
