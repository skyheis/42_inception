#!/bin/bash

useradd -m -U $FTP_USER --password $FTP_PASSWORD

chown -R $FTP_USER:$FTP_USER /home/$FTP_USER

echo "$FTP_USER" >> "/etc/vsftpd.userlist"

exec "$@"
