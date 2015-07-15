class phpunit(
    $target_dir      = "/usr/local/bin",
    $phpunit_file    = "phpunit",
    $download_method = "wget",
) {

    include augeas

    $tmp_path = "/home/vagrant"

    # Download PHPUnit
    if $download_method == "wget" {

        if defined(Package["wget"]) == false {
            package { "wget" :
                ensure => present,
            }
        }

        exec { "download_phpunit" :
            command     => "wget https://phar.phpunit.de/phpunit.phar -O phpunit.phar",
            cwd         => $tmp_path,
            require     => [
                Package["wget"],
                Augeas["whitelist_phar", "allow_url_fopen"]
            ],
            creates     => "$tmp_path/phpunit.phar",
            logoutput   => $logoutput,
        }
    } else {
        fail("The param download_method $download_method is not valid. Please set download_method to curl or wget.")
    }

    # Move phpunit.phar file to $target_dir
    file { "$target_dir/$phpunit_file" :
        ensure      => present,
        source      => "$tmp_path/phpunit.phar",
        require     => [ Exec["download_phpunit"], File[$target_dir] ],
        group       => "staff",
        mode        => "0755",
    }

    # Update PHPUnit with the --self-update command
    exec { "update_phpunit" :
        command     => "$target_dir/$phpunit_file --self-update",
        require     => File["$target_dir/$phpunit_file"],
    }
}
