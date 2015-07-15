# TODO REWRITE THIS USING A CUSTOM TYPE+PROVIDER
class php::pear inherits php::params {

    package { "pear" :
        name    => $pear_package_name,
        ensure  => present,
        require => Class["php"],
    }

    # upgrades PEAR, installs basic PHP tools
    exec { "pear_upgrade" :
        command => "pear upgrade",
        require => Package["pear"],
        returns => [ 0, "", " "],
    }

    exec { "pear_auto_discover" :
        command => "pear config-set auto_discover 1",
        require => [Package["pear"], Exec["pear_upgrade"]],
    }

    # Moved to its own module (phpunit directory) because the installation through pear is deprecated!
    #exec { "phpunit" :
    #    command => "sudo pear install pear.phpunit.de/PHPUnit",
    #    require => Exec["pear_auto_discover"],
    #    unless  => "pear list -c phpunit | grep 'PHPUnit'",
    #}
}
