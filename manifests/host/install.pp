#
#
#
class munin::host::install (
  $version = $munin::params::version,
) inherits munin::params {

  package { $munin::params::host_package:
    ensure => $version,
  }

}
