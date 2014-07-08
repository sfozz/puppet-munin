# host.pp - the master host of the munin installation
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

class munin::host (
  $cgi_graphing = false,
  $cgi_owner    = 'os_default',
  $export_tag   = 'munin'
) {

  class { 'munin::host::install': } ->
  class { 'munin::host::config': } ->
  Class [ 'munin::host']
  
  include munin::plugins::muninhost

  if $munin::host::cgi_graphing {
    class {'munin::host::cgi':
      owner => $cgi_owner,
    }
  }

  # from time to time we cleanup hanging munin-runs
  file{'/etc/cron.d/munin_kill':
    content => "4,34 * * * * root if $(ps ax | grep -v grep | grep -q munin-run); then killall munin-run; fi\n",
    owner   => root,
    group   => 0,
    mode    => '0644',
  }

}
