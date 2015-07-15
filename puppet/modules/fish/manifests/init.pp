class fish ($vagrant = true) {

    # Directories for fish config file
    $root_directories    = ["/root/.config", "/root/.config/fish"]
    $vagrant_directories = ["/home/vagrant/.config", "/home/vagrant/.config/fish"]

    # Fish config file
    $root_config_fish    = ["/root/.config/fish/config.fish"]
    $vagrant_config_fish = ["/home/vagrant/.config/fish/config.fish"]

    # The apt-update parameter is already declared in the repos module
    package { "fish" :
        require => Exec["apt-update"],
        ensure  => installed,
    }

    exec { "fish-as-default-shell-root" :
        command   => "chsh -s /usr/bin/fish root",
        require   => [ Package["fish"] ],
        logoutput => "on_failure",
    }

    file { $root_directories :
        ensure => directory,
        owner  => "root",
        group  => "root",
        mode   => "0644",
    }

    file { $root_config_fish :
        ensure => present,
        owner  => "root",
        group  => "root",
        mode   => "0644",
        source => "puppet:///modules/fish/config.fish",
    }

    if $vagrant {

        exec { "fish-as-default-shell-vagrant" :
            command   => "sudo chsh -s /usr/bin/fish vagrant",
            require   => [ Package["fish"] ],
            logoutput => "on_failure",
        }

        file { $vagrant_directories :
            ensure => directory,
            owner  => "vagrant",
            group  => "vagrant",
            mode   => "0644",
        }

        file { $vagrant_config_fish :
            ensure => present,
            owner  => "vagrant",
            group  => "vagrant",
            mode   => "0644",
            source => "puppet:///modules/fish/config.fish",
        }
    }
}
