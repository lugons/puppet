class vim
{
  include "apt"
  include "curl"
  include "exuberant-ctags"

  package
  {
    "vim-nox":
      ensure  => latest,
      require =>
      [
        Exec["apt-get-update"],
        Package["curl"],
        Package["exuberant-ctags"],
      ],
  }

  file
  {
    "/root/important":
      ensure => directory,
      mode   => 755,
      owner  => root,
      group  => root,
  }

  exec
  {
    "git-clone-vim":
      command => "/usr/bin/git clone git://github.com/mekanix/vim",
      cwd     => "/root/important",
      creates => "/root/important/vim",
  }

  exec
  {
    "configure-vim":
      command     => "/root/important/vim/bin/init.sh",
      cwd         => "/root",
      refreshonly => true,
      subscribe   => [
        Package["vim-nox"],
        Exec["git-clone-vim"],
      ],
  }
}
