class root
{
  file
  {
    "/root/.ssh/authorized_keys":
      ensure => present,
      source => "puppet:///modules/root/root/.ssh/authorized_keys",
      mode   => 600,
  }

  cron
  {
    "puppet-git-fetch":
      ensure  => present,
      user    => root,
      command => "cd /etc/puppet ; /usr/bin/git fetch ; /usr/bin/git reset --hard origin/master",
      minute  => '*/5',
  }
}
