#
#
#
class munin::client::install inherits munin::params {
  package { $munin::params::client_package:
    ensure => $munin::client::version,
  }
}
