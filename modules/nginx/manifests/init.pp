class nginx {

  include "apt"

  package
  {
    "nginx":
      ensure  => installed,
      require => Exec["apt-get-update"],
  }
}
