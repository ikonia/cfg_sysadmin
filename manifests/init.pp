# @summary this module is used to configure config, packages, files and tasks for standard sysadmin task
#
# @param pkgmgr_util_name name of package to install package manager utils for distro

class cfg_sysadmin (
  Optional[String]       $pkgmgr_util_name   = undef,

) {
  #Class['cfg_sysadmin::install']
  #  -> Class['cfg_sysadmin::config']
  }

