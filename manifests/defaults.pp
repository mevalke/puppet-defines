# Runs the defaults command on a Mac OS system with the parameters provided by the caller.
define defines::defaults (
  $domain,
  $key,
  $type,
  $desiredstate,
  Optional[String] $user = undef
) {
  exec { $name:
    command => "/usr/bin/defaults write $domain $key -$type $desiredstate",
    path    => '/bin:/usr/bin',
    unless  => "/usr/bin/defaults read $domain $key | /usr/bin/grep $desiredstate > /dev/null 2>&1",
    user    => $user,
  }
}

