# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvmtools::params
class openvmtools::params (
  ### START Package Configuration ###

  $package_name                          = 'open-vm-tools',
  $package_source                        = 'open-vm-tools',
  $package_flavor                        = undef,
  $manage_repo                           = false,
  Boolean $mime_types_preserve_defaults  = false,
  Optional[String] $repo_release         = undef,
  $passenger_package_ensure              = 'present',
  Optional[Stdlib::HTTPUrl] $repo_source = undef,
  ### END Package Configuration ###

  ### START Service Configuation ###
  $service_flags                         = undef,
  $service_restart                       = undef,
  $service_name                          = 'vmtoolsd',
  $service_manage                        = true,
  ### END Service Configuration ###
) {

  case $facts['virtual'] {
    'vmware': {
      $package_ensure = present
      $service_ensure = running
      $service_enable = true
    }
    default: {
      $package_ensure = absent
      $service_ensure = stopped
      $service_enable = false
    }
  }

  case $facts['os']['family'] {
    'Redhat': {

    }
    'Debian': {

    }
    'Suse': {

    }
    default: {
      fail("os family not supported : '${facts['os']['family']}'")
    }


  }

}
