# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvmtools
class openvmtools (
  ### START Package Configuration ###
  $package_ensure                        = present,
  $package_name                          = $openvmtools::params::package_name,
  $package_source                        = 'open-vm-tools',
  $package_flavor                        = undef,
  Boolean $manage_repo                   = $openvmtools::params::manage_repo,
  Boolean $mime_types_preserve_defaults  = false,
  Optional[String] $repo_release         = undef,
  $passenger_package_ensure              = 'present',
  Optional[Stdlib::HTTPUrl] $repo_source = undef,
  ### END Package Configuration ###

  ### START Service Configuation ###
  $service_ensure                        = $openvmtools::params::service_ensure,
  $service_enable                        = $openvmtools::params::service_enable,
  $service_flags                         = $openvmtools::params::service_flags,
  $service_restart                       = $openvmtools::params::service_restart,
  $service_name                          = $openvmtools::params::service_name,
  $service_manage                        = $openvmtools::params::service_manage,
  ### END Service Configuration ###

) inherits openvmtools::params {
  contain openvmtools::package
  contain openvmtools::config
  contain openvmtools::service
}
