#
#
#
class munin::client::config inherits munin::params {

  file { $munin::params::client_conf:
    ensure  => present,
    content => template('munin/munin-node.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  munin::plugin { $munin::params::client_plugins:
    ensure => present,
  }

  include munin::plugins::interfaces

}
