# TODO REWRITE THIS USING A CUSTOM TYPE+PROVIDER
class php::pear inherits php::params {

  package { 'pear':
    name => $pear_package_name,
    ensure => present,
    require => Class['php'],
  }

  # upgrades PEAR, installs basic PHP tools
  exec { "pear_upgrade":
    command => "pear upgrade",
    require => Package['pear'],
    returns => [ 0, '', ' '],
  }

  exec { "pear_auto_discover":
    command => "pear config-set auto_discover 1",
    require => [Package['pear'], Exec['pear_upgrade']],
  }

  exec { "phpunit":
    command => "sudo pear install pear.phpunit.de/PHPUnit-3.5.11",
    unless  => "pear list -c phpunit | grep 'PHPUnit'",
    require => Exec['pear_auto_discover'],
  }
}
