#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > confwp.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> confwp.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> confwp.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> confwp.sql
echo "FLUSH PRIVILEGES;" >> confwp.sql

if [ "$MYSQL_ROOT_PASSWORD" == "" ]; then
	mysql < confwp.sql
else
	mysql -uroot -p$MYSQL_ROOT_PASSWORD < confwp.sql
fi

service mysql stop

mysqld
