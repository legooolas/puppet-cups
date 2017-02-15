# Class: cups::papersize
#
# Sets the system's default `/etc/papersize`. See `man papersize` for supported values.
#
# String :: papersize
#
class cups::papersize (
  $papersize
) {
  validate_string($papersize)

  $papersize_e = shellquote($papersize)
  exec { "paperconfig-p-${papersize}":
    command => "paperconfig -p ${papersize_e}",
    unless  => "cat /etc/papersize | grep -w ${papersize_e}",
    path    => ['/usr/sbin/', '/usr/bin/', '/sbin/', '/bin/'],
  }
}
