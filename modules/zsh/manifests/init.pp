class zsh
{
  include "apt"

  package
  {
    'zsh':
      ensure  => latest,
      require => Exec["apt-get-update"],
  }

  file
  {
    "/etc/skel/.zshrc":
      ensure  => present,
      mode    => 644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/zsh/etc/skel/.zshrc",
      require => Package["zsh"],
  }

  file
  {
    "/etc/default/useradd":
      ensure  => present,
      mode    => 644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/zsh/etc/default/useradd",
      require => Package["zsh"],
  }

  file
  {
    "/etc/zsh":
      ensure  => directory,
      recurse => true,
      purge   => true,
      force   => true,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/zsh/etc/zsh",
      require => Package["zsh"],
  }

  file
  {
    "/usr/local/share/zsh/site-functions/prompt_wunjo_setup":
      ensure  => present,
      mode    => 644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/zsh/usr/local/share/zsh/site-functions/prompt_wunjo_setup",
      require => Package["zsh"],
  }

  file
  {
    "/usr/local/share/zsh/site-functions/zgitinit":
      ensure  => present,
      mode    => 644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/zsh/usr/local/share/zsh/site-functions/zgitinit",
      require => Package["zsh"],
  }

  file
  {
    "/etc/DIR_COLORS.256":
      ensure  => present,
      mode    => 644,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/zsh/etc/DIR_COLORS.256",
  }
}
