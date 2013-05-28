# Class: mercurial::params
#
#   The Mercurial configuration settings.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class git::params {

  case $::osfamily {
    'Debian': {
      $package_name   = 'git-core'
      $conf_dir       = '/etc'
      $conf_file      = 'gitconfig'
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily Debian")
    }
  }
}
