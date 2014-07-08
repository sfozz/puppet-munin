#
#
#
class munin::params {

  $version = 'installed'
  
  case $::osfamily {
    redhat: {
      $client_package = 'munin-node'
      $client_conf = '/etc/munin/munin-node.conf'
      $client_plugins = [ 'df', 'cpu', 'interrupts', 'load', 'memory',
                          'netstat', 'open_files', 'processes', 'swap',
                          'uptime', 'users', 'vmstat','df_abs', 'forks',
                          'df_inode', 'irqstats', 'entropy', 'open_inodes',
                          'diskstats', 'proc_pri', 'threads', ]
    }
    default: {
    }
  }
}
