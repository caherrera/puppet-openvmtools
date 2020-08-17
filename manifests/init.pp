# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvmtools
class openvmtools (
  ### START Package Configuration ###
  $package_ensure                        = $openvmtools::params::package_ensure,
  $package_name                          = $openvmtools::params::package_name,
  $package_source                        = $openvmtools::params::package_source,
  Boolean $manage_repo                   = $openvmtools::params::manage_repo,
  Optional[String] $repo_release         = $openvmtools::params::repo_release,
  Optional[Stdlib::HTTPUrl] $repo_source = $openvmtools::params::repo_source,
  ### END Package Configuration ###

  ### START Service Configuation ###
  $service_ensure                        = $openvmtools::params::service_ensure,
  $service_enable                        = $openvmtools::params::service_enable,
  $service_restart                       = $openvmtools::params::service_restart,
  $service_name                          = $openvmtools::params::service_name,
  $service_manage                        = $openvmtools::params::service_manage,
  ### END Service Configuration ###

) inherits openvmtools::params {
  contain openvmtools::package
  contain openvmtools::config
  contain openvmtools::service

  Class['openvmtools::package'] -> Class['openvmtools::config'] ~> Class['openvmtools::service']
  Class['openvmtools::package'] ~> Class['openvmtools::service']
}
