<VirtualHost *:80>
	ServerAdmin {{ server_admin }}
	ServerName {{ server_name }}
	ServerAlias www.{{ server_name }}

	DocumentRoot "{{ project_root }}"
	<Directory "{{ project_root }}">
		Options FollowSymLinks
		DirectoryIndex app_dev.php
		AllowOverride None
		Require all granted

		<IfModule mod_rewrite.c>
			RewriteEngine On
			RewriteCond %{REQUEST_FILENAME} !-f
			RewriteCond %{REQUEST_FILENAME} !-d
			RewriteRule ^(.*)$ app_dev.php [QSA,L]
		</IfModule>
	</Directory>

	LogLevel info
	ErrorLog ${APACHE_LOG_DIR}/{{ server_name }}.error.log
	CustomLog ${APACHE_LOG_DIR}/{{ server_name }}.access.log combined
</VirtualHost>
