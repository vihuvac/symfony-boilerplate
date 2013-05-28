# Class: apache
#
# This class installs Apache
#
# Parameters:
#
# Actions:
#   - Install Apache
#   - Manage Apache service
#
# Requires:
#
# Sample Usage:
#
class apache(
  $httpd_user = 'www-data',
  $httpd_group = 'www-data'
) inherits apache::params {

  package { 'httpd':
    ensure => installed,
    name   => $apache::params::apache_name,
  }

  service { 'httpd':
    ensure    => running,
    name      => $apache::params::apache_name,
    enable    => true,
  }

  file { 'httpd_vdir':
    ensure  => directory,
    path    => $apache::params::vdir,
    recurse => true,
    purge   => true,
  }

  file { 'httpd_lock':
    ensure  => present,
    path    => '/var/lock/apache2',
    owner   => $httpd_user,
    group   => $httpd_group,
  }

  file { 'httpd_envvars':
    ensure  => present,
    path    => "${$apache::params::confroot}envvars",
    content => template($apache::params::tpl_envvars),
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
  }

  File['httpd_envvars'] -> File['httpd_lock']
  File['httpd_lock'] -> Service['httpd']
  Package['httpd'] -> Service['httpd']
  Package['httpd'] -> File['httpd_envvars']
  Package['httpd'] -> File['httpd_vdir']

}
