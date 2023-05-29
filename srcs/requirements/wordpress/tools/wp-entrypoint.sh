#!/bin/bash

# service php7.4-fpm start

wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz

tar -xzf /tmp/wordpress.tar.gz -C /tmp

mkdir -p /var/www/html

mv /tmp/wordpress/* /var/www/html

chown -R www-data.www-data /var/www/html
chmod -R 755 /var/www/html

service php8.0-fpm start
service php8.0-fpm stop

exec "$@"
