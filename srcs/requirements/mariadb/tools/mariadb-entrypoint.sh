#!/bin/bash

set -e

# echo "MYSQL_DATABASE $MYSQL_DATABASE MYSQL_USER $MYSQL_USER MYSQL_PASSWORD $MYSQL_PASSWORD"

service mariadb start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then 
	echo "Database already exists"
else

	echo "Database secure installation"
	# mariadb-secure-installation edited to remove 'read'
	/usr/bin/gigidb-secure-installation

	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -uroot
	echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -uroot
	echo " FLUSH PRIVILEGES;" | mysql -u root

	#Import database in the mysql command line
	mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /opt/wordpress.sql

fi

service mariadb stop

exec "$@"
