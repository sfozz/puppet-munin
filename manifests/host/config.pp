#
#
#
class munin::host::config inherits munin::params {

  Concat::Fragment <<| tag == $export_tag |>>

  concat::fragment{'munin.conf.header':
    target => '/etc/munin/munin.conf',
    source => [ "puppet:///modules/site_munin/config/host/${::fqdn}/munin.conf.header",
                "puppet:///modules/site_munin/config/host/munin.conf.header.${::operatingsystem}.${::lsbdistcodename}",
                "puppet:///modules/site_munin/config/host/munin.conf.header.${::operatingsystem}",
                'puppet:///modules/site_munin/config/host/munin.conf.header',
                "puppet:///modules/munin/config/host/munin.conf.header.${::operatingsystem}.${::lsbdistcodename}",
                "puppet:///modules/munin/config/host/munin.conf.header.${::operatingsystem}",
                'puppet:///modules/munin/config/host/munin.conf.header' ],
    order  => 05,
  }

  concat{ '/etc/munin/munin.conf':
    owner => $munin::params::user,
    group => $munin::params::group,
    mode  => '0644',
  }

}
