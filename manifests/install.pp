# comment here
# more comments
class cfg_sysadmin::install {

if $facts['os'][family] == 'RedHat' {
  package { 'cfg_sysadmin::pkgmgr_util_name':
    ensure => 'present',
    name   => $::cfg_sysadmin::pkgmgr_util_name
  }
}
}
