class other ($vagrant = true) {
    $packages = ["htop", "tmux", "vim", "multitail", "tzdata", "openjdk-6-jre"]
    $aliases  = ["/home/vagrant/.bash_aliases", "/root/.bash_aliases"]
    $profiles = ["/home/vagrant/.profile", "/root/.profile"]

    package { $packages :
        ensure => present,
    }

    file { "/root/.bash_aliases" :
        ensure => present,
        owner  => "root",
        group  => "root",
        mode   => "0644",
        source => "puppet:///modules/other/bash_aliases",
    }

    file { "/root/.profile" :
        ensure => present,
        owner  => "root",
        group  => "root",
        mode   => "0644",
        source => "puppet:///modules/other/profile",
    }

    if $vagrant {
        file { "/home/vagrant/.bash_aliases" :
            ensure => present,
            owner  => "vagrant",
            group  => "vagrant",
            mode   => "0644",
            source => "puppet:///modules/other/bash_aliases",
        }

        file { "/home/vagrant/.profile" :
            ensure => present,
            owner  => "vagrant",
            group  => "vagrant",
            mode   => "0644",
            source => "puppet:///modules/other/profile",
        }

        host { "host" :
            ip => "192.168.33.1",
        }
    }
}
