class php::params {

  # Purge directories managed by puppet ?
  $purge_dirs = false

  # php.ini default settings
  $memory_limit           = '128M'
  $max_execution_time     = '30'
  $max_input_time         = '60'
  $display_errors         = 'On'
  $display_startup_errors = 'On'
  $error_reporting        = 'E_ALL | E_STRICT'
  $post_max_size          = '64M'
  $upload_max_filesize    = '64M'

  case $::osfamily {
    'Debian': {
      $php_package_name = "php5"
      $php_dev_package_name = "php5-dev"

      $base_dir = "/etc/php5/"
      $extra_dir = "${base_dir}extra/"
      $conf_dir = "${base_dir}conf.d/"

      # PHP CLI
      $cli_dir = "${base_dir}cli/"
      $cli_ini = "${cli_dir}php.ini"
      $cli_package_name = "php5-cli"
      $tpl_php53cli_ini = "php/php-cli.ini.erb"

      # PHP FPM
      $fpm_dir = "${base_dir}fpm/"
      $fpm_pool_dir = "${fpm_dir}pool.d/"
      $fpm_ini = "${fpm_dir}php.ini"
      $fpm_package_name = "php5-fpm"
      $fpm_conf = "${fpm_dir}php-fpm.conf"
      $fpm_service_name = "php5-fpm"

      # PHP APACHE
      $apache_dir = "${base_dir}apache2/"
      $apache_ini = "${apache_dir}php.ini"
      $apache_package_name = "libapache2-mod-php5"
      $apache_name = "apache2"    #FIXME remove service name from this module.
      $tpl_php53apache_ini = "php/php-apache.ini.erb"

      #Additional configurations
      $date_ini  = "${conf_dir}date.ini"
      $no_time_limit_ini = "${conf_dir}no_time_limit.ini"


# Extension packages
      $pear_package_name = "php-pear"
    }
  }

  # Extensions and PEAR Packages
  $apc_ini  = "${conf_dir}apc.ini"
  $xdebug_ini  = "${conf_dir}xdebug.ini"
  $mongo_ini  = "${conf_dir}mongo.ini"
  $memcache_ini  = "${conf_dir}memcache.ini"

}
