class curl
{
  include "apt"

  package
  {
    "curl":
      ensure  => latest,
      require => Exec["apt-get-update"],
  }
}
