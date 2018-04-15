define defines::lpadmin (
  $printer_name,
  $location,
  $info,
  $device_uri,
  $ppd_file,
  $options,
) {
  exec { $printer_name:
    command => "/usr/sbin/lpadmin -p $printer_name -L $location -D $info -v $device_uri -P $ppd_file $options -E",
    path    => '/bin:/usr/bin:/usr/sbin',
    onlyif  => "/bin/ls $ppd_file",
    unless  => "/usr/bin/lpstat -p |grep $printer_name",
  }
}
