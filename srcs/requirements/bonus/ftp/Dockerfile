FROM debian:stable-20230411

RUN apt-get update && apt-get install -y \
	vsftpd openssl \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 21

RUN useradd -m -U $FTP_USER --password $FTP_PASSWORD && \
	chown -R $FTP_USER:$FTP_USER /home/$FTP_USER

COPY ./config/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN echo "$FTP_USER" >> "/etc/vsftpd.userlist"

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
