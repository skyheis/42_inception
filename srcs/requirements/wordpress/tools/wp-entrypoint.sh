#!/bin/bash

# service php7.4-fpm start

wget -O /tmp/wordpress.tar.gz https://wordpress.org/wordpress-6.1.3.tar.gz

tar -xzf /tmp/wordpress.tar.gz -C /tmp

mkdir -p /var/www/html

mv /tmp/wordpress/* /var/www/html

chown -R www-data.www-data /var/www/html
chmod -R 755 /var/www/html

service php7.4-fpm start
service php7.4-fpm stop

exec "$@"
