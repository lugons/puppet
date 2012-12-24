class tmux
{
  include "apt"

  package
  {
    "tmux":
      ensure  => latest,
      require => Exec["apt-get-update"],
  }

  file
  {
    "/etc/tmux.conf":
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => 644,
      source  => "puppet:///modules/tmux/etc/tmux.conf",
      require => Package["tmux"],
  }
}
