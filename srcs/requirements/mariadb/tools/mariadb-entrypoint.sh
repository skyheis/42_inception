#!/bin/bash

set -e

MYSQL_DATABASE=wordpress
MYSQL_USER=ggiannit
MYSQL_PASSWORD=culocane
MYSQL_ROOT_PASSWORD=totiroti

service mariadb start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then 
	echo "Database already exists"
else

	echo "Database secure installation"
	# mariadb-secure-installation edited to remove 'read'
	# /usr/bin/gigidb-secure-installation
	mariadb-secure-installation

	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -uroot
	echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -uroot
	echo " FLUSH PRIVILEGES;" | mysql -u root

	#Import database in the mysql command line
	mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

service mariadb stop

exec "$@"

# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > confwp.sql
# echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> confwp.sql
# echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> confwp.sql
# # echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> confwp.sql
# echo "FLUSH PRIVILEGES;" >> confwp.sql

# mysql < confwp.sql

# if [ "$MYSQL_ROOT_PASSWORD" == "" ]; then
# 	mysql < confwp.sql
# else
# 	mysql -uroot -p$MYSQL_ROOT_PASSWORD < confwp.sql
# fi
