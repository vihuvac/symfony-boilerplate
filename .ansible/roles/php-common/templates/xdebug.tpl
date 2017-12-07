zend_extension = {{ xdebug_extension }}

xdebug.dump_globals          = 1
xdebug.dump_once             = 1
xdebug.cli_color             = 1
xdebug.idekey                = {{ xdebug_ide_key }}
xdebug.remote_autostart      = 1
xdebug.remote_connect_back   = 1
xdebug.remote_enable         = 1
xdebug.remote_handler        = dbgp
xdebug.remote_host           = {{ xdebug_remote_host }}
xdebug.remote_port           = 9009
xdebug.show_error_trace      = 1
xdebug.show_local_vars       = 1
xdebug.var_display_max_depth = 100
