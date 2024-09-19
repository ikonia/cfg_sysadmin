# comment here
# more comments
class cfg_sysadmin::config {

# install missing ruby library package for Raspbian hosts
  package { 'ruby-shadow':
    ensure => 'present',
    name   => 'ruby-shadow'
  }
}

