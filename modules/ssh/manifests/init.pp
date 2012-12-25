class ssh
{
  include "apt"

  package
  {
    'openssh-server':
      ensure => latest,
      require => Exec["apt-get-update"],
  }

  file
  {
    "/etc/ssh/sshd_config":
      ensure => present,
      mode => 644,
      owner  => root,
      group  => root,
      source => "puppet:///modules/ssh/etc/ssh/sshd_config",
      require => Package["openssh-server"],
  }

  service
  {
    "ssh":
      ensure => running,
      subscribe => File["/etc/ssh/sshd_config"],
  }
}
