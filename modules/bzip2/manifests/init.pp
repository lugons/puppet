class bzip2
{
  include "apt"

  package
  {
    "bzip2":
      ensure  => latest,
      require => Exec["apt-get-update"],
  }
}
