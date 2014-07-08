# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.
# Adapted and improved by admin(at)immerda.ch

# configure a munin node
class munin::client(
  $allow       = [ '127.0.0.1' ],
  $listen      = '*',
  $target      = $::fqdn,
  $port        = '4949',
  $use_ssh     = false,
  $export_tag  = 'munin',
  $description = undef,
  $munin_group = undef,
  $config      = [ 'use_node_name yes', 'load.load.warning 5', 'load.load.critical 10' ],
  $enable      = true,
  $ensure      = true,
) {

  class { 'munin::client::install': } ->
  class { 'munin::client::config': } ~>
  class { 'munin::client::service': } ->
  class { 'munin::client::register': } ->
  Class ['munin::client']

  Class ['munin::client::install'] ~> Class ['munin::client::service']

}
