# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvmtools::package
class openvmtools::package (
  ### START Package Configuration ###
  $package_ensure                        = $openvmtools::package_ensure,
  $package_source                        = $openvmtools::package_source,
  $package_flavor                        = $openvmtools::package_flavor,
  $manage_repo                           = $openvmtools::manage_repo,
  Optional[String] $repo_release         = $openvmtools::repo_release,
  $passenger_package_ensure              = $openvmtools::passenger_package_ensure,
  Optional[Stdlib::HTTPUrl] $repo_source = $openvmtools::repo_source,
  ### END Package Configuration ###

) inherits openvmtools {
  assert_private()
  package { $package_name:
    ensure => $package_ensure,
    flavor => $package_flavor,
    source => $package_source,
  }
}
