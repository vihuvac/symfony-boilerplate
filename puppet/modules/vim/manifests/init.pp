class vim ($vagrant = true) {

    # Directories for the editor (vim)
    $root_directory    = ["/root/.vim"]
    $vagrant_directory = ["/home/vagrant/.vim"]

    # The vimrc file
    $root_vimrc_file    = ["/root/.vimrc"]
    $vagrant_vimrc_file = ["/home/vagrant/.vimrc"]

    file { $root_directory :
        ensure  => directory,
        owner   => "root",
        group   => "root",
        mode    => "0644",
        recurse => true,
        purge   => true,
        source  => "puppet:///modules/vim/vim",
    }

    file { $root_vimrc_file :
        ensure => present,
        owner  => "root",
        group  => "root",
        mode   => "0644",
        source => "puppet:///modules/vim/vimrc",
    }

    if $vagrant {

        file { $vagrant_directory :
            ensure  => directory,
            owner   => "vagrant",
            group   => "vagrant",
            mode    => "0644",
            recurse => true,
            purge   => true,
            source  => "puppet:///modules/vim/vim",
        }

        file { $vagrant_vimrc_file :
            ensure => present,
            owner  => "vagrant",
            group  => "vagrant",
            mode   => "0644",
            source => "puppet:///modules/vim/vimrc",
        }
    }
}
