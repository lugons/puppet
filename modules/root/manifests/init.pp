class root
{
  include "fish"

  user
  {
    "root":
      ensure  => present,
      shell   => "/usr/local/bin/fish",
      require => Package["fishfish"],
  }

  file
  {
    "/root/.ssh/authorized_keys":
      ensure => present,
      source => "puppet:///modules/root/root/.ssh/authorized_keys",
      mode   => 600,
  }

  file
  {
    "/root/.gitconfig":
      ensure => present,
      source => "puppet:///modules/root/root/.gitconfig",
      mode   => mode,
  }

  cron
  {
    "puppet-git-fetch":
      ensure  => present,
      user    => root,
      command => "cd /etc/puppet ; /usr/bin/git fetch ; /usr/bin/git reset --hard origin/master",
      minute  => '*/5',
  }

  file
  {
    "/root/.config":
      ensure  => directory,
      mode    => 755,
      require => Package["fishfish"],
  }

  exec
  {
    "configure-fish":
      command => "/usr/bin/git clone git://github.com/mekanix/fish.git",
      cwd     => "/root/.config",
      creates => "/root/.config/fish",
      require => File["/root/.config"],
  }

  cron
  {
    "update-fish-config":
      ensure  => present,
      user    => root,
      command => "cd /root/.config/fish ; /usr/bin/git fetch ; /usr/bin/git reset --hard origin/master",
      minute  => "*/5",
  }
}
