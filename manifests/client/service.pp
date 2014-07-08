#
#
#
class munin::client::service inherits munin::params {

  service { $munin::params::client_service:
    ensure => $munin::client::ensure,
    enable => $munin::client::enable,
  }

}
