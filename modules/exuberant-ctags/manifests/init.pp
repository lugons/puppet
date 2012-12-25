class exuberant-ctags
{
  include "apt"

  package
  {
    "exuberant-ctags":
      ensure  => latest,
      require => Exec["apt-get-update"],
  }
}
