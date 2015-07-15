node "default" {

    # Importing git credentials
    import "git_config.pp"

    # Dotdeb repository
    include dotdeb

    # Repos configuration
    include repos

    # NFS
    include nfsclient

    # Bash aliases
    include other

    # Fish shell
    include fish

    # Vim editor
    include vim

    # PHPUnit
    include phpunit


    Exec {
        path => ["/usr/local/bin", "/opt/local/bin", "/usr/bin", "/usr/sbin", "/bin", "/sbin"]
    }

    # This makes puppet and vagrant shut up about the puppet group
    group {
        "puppet" : ensure => "present"
    }

    # Apache
    class {
        "apache" :
            httpd_user  => "vagrant",
            httpd_group => "vagrant",
    }

    a2mod {
        "rewrite" : ensure => "present"
    }
    a2mod {
        "expires" : ensure => "present"
    }

    # MySQL
    class { "mysql" : }
    class {
        "mysql::server" :
            config_hash => {
                "root_password" => "",
                "bind_address"  => "0.0.0.0",
            }
    }

    class {
        "nodejs" : version => "stable"
    }

    # Ensure PHP Cli & Apache
    class { "php" : }
    class {
        "php::apache2" :
            memory_limit       => "256M",
            max_execution_time => 300, #5 minutes
    }
    # Ensure MySQL bindings for PHP
    class { "mysql::php" : }

    class { "php::pear" : }
    class {
        "php::pecl" : xdebug_remotehost  => "192.168.33.1"
    }

    class { "memcached" : }

    class {
        "composer" :
            target_dir      => "/usr/local/bin",
            composer_file   => "composer",
            download_method => "curl", # download methods are curl or wget
            logoutput       => false
    }

    apache::vhost {
        $fqdn :
            port               => "80",
            docroot            => "/vagrant/project/web",
            serveradmin        => "admin@domain.dev",
            configure_firewall => false
    }
}
