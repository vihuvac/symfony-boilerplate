node "default" {

    Exec {
        path => ["/usr/local/bin", "/opt/local/bin", "/usr/bin", "/usr/sbin", "/bin", "/sbin"]
    }

    # this makes puppet and vagrant shut up about the puppet group
    group {
        "puppet" : ensure => "present"
    }

    # Dotdeb repository
    include dotdeb

    #repos configuration
    include repos

    # NFS
    include nfsclient

    # APACHE
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


    # Ensure php cli & apache
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
    include other

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
            configure_firewall => false,
    }

    import "git_config.pp"
}
