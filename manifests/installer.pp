# Installs a pkg on a Mac OS system.
define defines::installer (
  $package,
  $unless,
) {
  exec {$name:
    command => "/usr/sbin/installer -pkg $package -target /",
    path    => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
    unless  => $unless,
    onlyif  => "ls $package",
  }
}
