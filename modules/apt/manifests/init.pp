class apt
{
  file
  {
    "/etc/apt/sources.list.d/backports.list":
      ensure => present,
      mode   => 644,
      owner  => root,
      group  => root,
      source => "puppet:///modules/apt/etc/apt/sources.list.d/backports.list",
      notify => File["/etc/apt/preferences.d/backports"],
  }

  file
  {
    "/etc/apt/preferences.d/backports":
      ensure => present,
      mode   => 644,
      owner  => root,
      group  => root,
      source => "puppet:///modules/apt/etc/apt/preferences.d/backports",
      notify => Exec["apt-get-update"],
  }

  file
  {
    "/etc/apt/sources.list.d/icinga.list":
      ensure => present,
      mode   => 644,
      owner  => root,
      group  => root,
      source => "puppet:///modules/apt/etc/apt/sources.list.d/icinga.list",
      notify => Exec["get-icinga-pgp"],
  }

  exec
  {
    "get-icinga-pgp":
      path        => ["/usr/bin"],
      command     => "wget -O - http://icingabuild.dus.dg-i.net/icinga-key.pub | apt-key add -",
      refreshonly => true,
      notify      => Exec["apt-get-update"],
  }

  file
  {
    "/etc/apt/sources.list.d/dotdeb.list":
      ensure => present,
      mode   => 644,
      owner  => root,
      group  => root,
      source => "puppet:///modules/apt/etc/apt/sources.list.d/dotdeb.list",
      notify => Exec["get-dotdeb-pgp"],
  }

  exec
  {
    "get-dotdeb-pgp":
      path        => ["/usr/bin"],
      command     => "wget -O - http://www.dotdeb.org/dotdeb.gpg | apt-key add -",
      refreshonly => true,
      notify      => Exec["apt-get-update"],
  }

  file
  {
    "/etc/apt/sources.list.d/newrelic.list":
      ensure => present,
      mode   => 644,
      owner  => root,
      group  => root,
      source => "puppet:///modules/apt/etc/apt/sources.list.d/newrelic.list",
      notify => Exec["get-newrelic-pgp"],
  }

  exec
  {
    "get-newrelic-pgp":
      path        => ["/usr/bin"],
      command     => "wget -O - http://download.newrelic.com/548C16BF.gpg | apt-key add -",
      refreshonly => true,
      notify      => Exec["apt-get-update"],
  }

  exec
  {
    "apt-get-update":
      command     => "apt-get update",
      refreshonly => true,
      path        => ["/usr/bin"],
  }
}
