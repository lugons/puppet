class fish
{
  include "apt"
  include "git"

  $fish_package = "fishfish_0.9-1_amd64.deb"

  file
  {
    "/var/cache/apt/archives/$fish_package":
      ensure  => present,
      source  => "puppet:///modules/fish//var/cache/apt/archives/$fish_package",
      mode    => 644,
  }

  package
  {
    "fishfish":
      ensure   => installed,
      provider => dpkg,
      source   => "/var/cache/apt/archives/$fish_package",
      require  => File["/var/cache/apt/archives/$fish_package"],
  }
}
