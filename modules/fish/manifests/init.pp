class fish
{
  include "apt"
  include "git"

  $fish_package = "fishfish_0.9-1_amd64.deb"

  file
  {
    "/root/important/$fish_package":
      ensure  => present,
      source  => "puppet:///modules/fish/root/important/$fish_package",
      mode    => 644,
      require => Exec["apt-get-update"],
  }

  package
  {
    "fishfish":
      ensure   => installed,
      provider => dpkg,
      source   => "/root/important/$fish_package",
      require  => File["/root/important/$fish_package"],
  }
}
