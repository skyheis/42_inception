#!/bin/bash

MYSQL_DATABASE=wordpress
MYSQL_USER=ggiannit
MYSQL_PASSWORD=culocane

# service php7.4-fpm start

if [ -d "/var/www/html/wp-admin" ]; then
	echo "Wordpress already installed"
else
	echo "Wordpress installation"
	wget -O /tmp/wordpress.tar.gz https://wordpress.org/wordpress-6.1.3.tar.gz

	tar -xzf /tmp/wordpress.tar.gz -C /tmp

	mkdir -p /var/www/html

	mv /tmp/wordpress/* /var/www/html

fi

chown -R www-data.www-data /var/www/html
chmod -R 755 /var/www/html

if [ -f "/var/www/html/wp-config.php" ]; then
	echo "Wordpress already configured"
else

	mv /tmp/uploads /var/www/html/wp-content/uploads

	echo "Wordpress configuration"
	
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	
	wp core config --dbhost=ggiannit_mariadb --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD
	
	chmod 660 wp-config.php
fi


service php7.4-fpm start
service php7.4-fpm stop

exec "$@"
