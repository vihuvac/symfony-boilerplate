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
class git(
  $username,
  $usermail,
  $package_ensure = 'present',
  $github_username,
  $kaleidoscop = undef
) inherits git::params {

  package { 'git' :
    name    => $package_name,
    ensure  => $package_ensure
  }

  file { 'gitconfig':
    ensure  => $package_ensure,
    path    => "${$conf_dir}/${$conf_file}",
    content => template('git/gitconfig.erb'),
    require => Package['git'],
  }
}
