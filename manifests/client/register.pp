# Register a munin client
class munin::client::register (
  $host         = $munin::client::target,
  $port         = $munin::client::port,
  $use_ssh      = $munin::client::use_ssh,
  $description  = $munin::client::description,
  $config       = $munin::client::config,
  $export_tag   = $munin::client::export_tag,
  $group        = $munin::client::munin_group,
){

  @@concat::fragment{ "munin_client_${::fqdn}_${port}":
    target  => '/etc/munin/munin.conf',
    content => template('munin/client.erb'),
    tag     => $export_tag,
  }

}
