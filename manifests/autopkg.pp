# Runs the autopkg script on a Mac OS system with the parameters provided by the caller.
define defines::autopkg (
  $munkirepo,
  $verb,
  $options,
  $user,
) {
  exec { $name:
	  command => "/usr/local/bin/autopkg $verb $options",
	  onlyif  => "ls -l /usr/local/bin/autopkg && ls -l $munkirepo",
	  timeout => 0,
	  path    => '/bin:/usr/bin:/usr/local/bin',
	  user    => "$user",
  }
}



