# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include webserver
class webserver {
  include nginx

  file { '/tmp/test1':
    ensure  => file,
  }
}
