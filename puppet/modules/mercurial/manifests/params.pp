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
class mercurial::params {

  $auth_groups    = []

  case $::osfamily {
    'Debian': {
      $package_name   = 'mercurial'
      $conf_dir       = '/etc/mercurial'
      $conf_file      = 'hgrc'
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily Debian")
    }
  }
}
