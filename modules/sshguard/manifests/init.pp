class sshguard
{
  include "ssh"

  package
  {
    "sshguard":
      ensure  => latest,
      require => Package["openssh-server"],
  }

  file
  {
    "/etc/sshguard/whitelist":
      ensure  => present,
      source  => "puppet:///modules/sshguard/etc/sshguard/whitelist",
      mode    => 644,
      require => Package["sshguard"],
  }

  service
  {
    "sshguard":
      ensure    => running,
      hasstatus => true,
      enable    => true,
      subscribe => File["/etc/sshguard/whitelist"],
  }
}
