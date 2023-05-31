#!/bin/bash

# echo "MYSQL_DATABASE $MYSQL_DATABASE MYSQL_USER $MYSQL_USER MYSQL_PASSWORD $MYSQL_PASSWORD"

if [ -d "/var/www/html/wp-admin" ]; then
	echo "Wordpress already installed"
else
	echo "Wordpress installation"
	wget -q -O /tmp/wordpress.tar.gz https://wordpress.org/wordpress-6.1.3.tar.gz

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
	
	wget -q -O /usr/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	
	chmod +x /usr/bin/wp

	wp --allow-root --path=/var/www/html core config --dbhost=ggiannit_mariadb --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD

	wp config set WP_REDIS_HOST ggiannit_redis --allow-root --path=/var/www/html
	wp config set WP_REDIS_PORT 6379 --raw --allow-root --path=/var/www/html
	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root --path=/var/www/html
	wp config set WP_REDIS_CLIENT phpredis --allow-root --path=/var/www/html
	wp plugin install redis-cache --activate --allow-root --path=/var/www/html
	wp plugin update --all --allow-root --path=/var/www/html
	wp redis enable --allow-root --path=/var/www/html

	# echo "define('WP_HOME','https://ggiannit.42.fr');" >> /var/www/html/wp-config.php
	# echo "define('WP_SITEURL','https://ggiannit.42.fr');" >> /var/www/html/wp-config.php
fi

service php7.4-fpm start
service php7.4-fpm stop

exec "$@"
