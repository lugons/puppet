class root
{
  file
  {
    "/root/.ssh/authorized_keys":
      ensure => present,
      source => "puppet:///modules/root/root/.ssh/authorized_keys",
      mode   => 600,
  }
}
