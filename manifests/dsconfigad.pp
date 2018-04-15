# Binds a Mac to an Active Directory domain.
define defines::dsconfigad (
  $domainadmin,
  $domainadminpw,
  $domain,
  $ou,
) {
  exec { $name:
    command => "/usr/sbin/dsconfigad -force -a $::hostname -u $domainadmin -password $domainadminpw -ou $ou -domain $domain -mobile enable -mobileconfirm enable -useuncpath enable -groups \"Domain Admins,Enterprise Admins\" -alldomains enable > /tmp/dsconfigadlog", 
    path    => '/bin:/usr/bin:/usr/sbin',
    unless  => "dsconfigad -show domain|grep $domain"
	}
}
