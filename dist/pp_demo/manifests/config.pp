# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include pp_demo::config
class pp_demo::config {
  file { '/etc/rsyslog.d/10_modules.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => '$ModLoad imudp.so',
    require => Package['rsyslog'],
    notify  => Service['rsyslog'],
  }
}
