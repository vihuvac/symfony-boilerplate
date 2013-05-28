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
# class{'mercurial':
#   username    => "My Name <myself@me>",
#   auth_groups => [{
#     group     => 'default',
#     prefix    => 'URL',
#     username  => 'USERNAME',
#     password  => 'PASSWORD',
#     schemes   => 'http'
#   }]
# }
#
#
class mercurial(
  $username,
  $auth_groups = $mercurial::params::auth_groups,
  $package_ensure = 'present'
) inherits mercurial::params {

  package { 'hg' :
    name    => $package_name,
    ensure  => $package_ensure
  }

  file { 'hgrc':
    ensure  => $package_ensure,
    path    => "${$conf_dir}/${$conf_file}",
    content => template('mercurial/hgrc.erb'),
    require => Package['hg'],
  }
}
