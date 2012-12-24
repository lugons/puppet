class wgetpaste
{
  file
  {
    "/usr/bin/wgetpaste":
      ensure  => present,
      mode    => 755,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/wgetpaste/usr/bin/wgetpaste",
  }
}
