# TODO REWRITE THIS USING A CUSTOM TYPE+PROVIDER

# FIXME xdebug installation doesn't work. The fact used by the template to print the php extension dir is not calculated correctly.


class php::pecl(
  $xdebug_remotehost
) inherits php::params {

  package { 'libpcre3-dev':
    ensure => present,
  }

  package { 'make':
    ensure => present,
  }

  package { 'php-dev':
    name => $php_dev_package_name,
    ensure => present,
  }

# Install xdebug via PECL
  exec { 'pecl_xdebug':
    command => "pecl install xdebug",
    unless => "pecl list | grep -i 'xdebug'",
    require => [
      Package['pear', 'php-dev', 'make'],
      Exec['pear_upgrade']
    ],
  }

# Install more recent APC version from PECL
  exec { "pecl_apc":
    command => "pecl install apc",
    unless => "pecl list | grep -i apc",
    require => [
      Package['pear','php-dev','libpcre3-dev', 'make'],
      Exec['pear_upgrade']
    ],
  }

  file { $apc_ini:
    ensure => present,
    owner => 'root',
    group => 'root',
    source => "puppet:///modules/php/apc.ini",
    require => Exec['pecl_apc'],
  }

# Install latest mongo version from PECL

  exec { "pecl_mongo":
    command => "pecl install mongo",
    unless => "pecl list | grep -i mongo",
    require => [
      Package['pear','php-dev','libpcre3-dev', 'make'],
      Exec['pear_upgrade']
    ],
  }

  file { $mongo_ini:
    ensure => present,
    owner => 'root',
    group => 'root',
    source => "puppet:///modules/php/mongo.ini",
    require => Exec['pecl_mongo'],
  }

# Install latest memcache version from PECL

  exec { "pecl_memcache":
    command => "pecl install memcache",
    unless => "pecl list | grep -i memcache",
    require => [
      Package['pear','php-dev','libpcre3-dev', 'make'],
      Exec['pear_upgrade']
    ],
  }

  file { $memcache_ini:
    ensure => present,
    owner => 'root',
    group => 'root',
    source => "puppet:///modules/php/memcache.ini",
    require => Exec['pecl_memcache'],
  }

  file { $xdebug_ini:
    ensure => present,
    content => template("php/xdebug.ini.erb"),
    owner => 'root',
    group => 'root',
    require => Exec['pecl_xdebug'],
    notify => Service['httpd'],
  }

  file { "apc_php":
    path => "/var/www/apc.php",
    ensure => present,
    source => "puppet:///modules/php/apc.php",
    require => [Package['php'], Exec['pecl_apc']],
    notify => Service['httpd'],
  }
}
