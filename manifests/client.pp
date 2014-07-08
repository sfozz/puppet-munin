# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.
# Adapted and improved by admin(at)immerda.ch

# configure a munin node
class munin::client(
  $allow                      = [ '127.0.0.1' ],
  $host                       = '*',
  $host_name                  = $::fqdn,
  $port                       = '4949',
  $use_ssh                    = false,
  $export_tag                 = 'munin',
  $description                = 'absent',
  $munin_group                = 'absent',
) {

  class { 'munin::client::install': } ->
  class { 'munin::client::config': } ~>
  class { 'munin::client::service': } ->
  Class ['munin::client']

  Class ['munin::client::install'] ~> Class ['munin::client::service']

}
