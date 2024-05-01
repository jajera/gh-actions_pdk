# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include pp_demo::install
class pp_demo::install {
  package { 'rsyslog':
    ensure => 'installed',
  }
  service { 'rsyslog':
    ensure  => 'running',
    enable  => 'true',
    require => Package['rsyslog'],
  }
}
