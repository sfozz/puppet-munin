#
#
#
class munin::client::service inherits munin::params {

  service { $munin::params::service:
    ensure => $munin::client::ensure,
    enable => $munin::client::enable,
  }

}
