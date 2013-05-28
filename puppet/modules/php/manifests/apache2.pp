class php::apache2(
  $memory_limit        = $php::params::memory_limit,
  $max_execution_time  = $php::params::max_execution_time,
  $max_input_time      = $php::params::max_input_time,
  $display_errors      = $php::params::display_errors,
  $display_startup_errors = $php::params::display_startup_errors,
  $error_reporting     = $php::params::error_reporting,
  $post_max_size       = $php::params::post_max_size,
  $upload_max_filesize = $php::params::upload_max_filesize
) inherits php::params {

  include php

  package { 'php_httpd':
    name   => $php::params::apache_package_name,
    ensure => present,
    notify => Service[$apache::params::apache_name],
  }

  file { "php_apache_dir":
    path    => $php::params::apache_dir,
    owner   => root,
    group   => root,
    purge   => $php::params::purge_dirs,
    recurse => true,
    force   => true,
    require => Class['php'],
    notify  => Service[$apache::params::apache_name],
    ensure  => directory,
  }

  file { "${php::params::apache_dir}conf.d":
    ensure  => "../conf.d",
    require => [File['php_apache_dir'], Package['php_httpd']],
    notify  => Service[$apache::params::apache_name],
  }

  file { $php::params::apache_ini:
    owner   => root,
    group   => root,
    notify  => Service[$apache::params::apache_name],
    content => template($php::params::tpl_php53apache_ini),
    require => Package['php_httpd'],
    ensure  => file,
  }
}
