FROM debian:stable-20230411

RUN apt-get update && apt-get install -y \
	vsftpd openssl \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 21


COPY ./config/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./tools/ftp-entrypoint.sh /usr/bin/ftp-entrypoint.sh

RUN chmod +x /usr/bin/ftp-entrypoint.sh

ENTRYPOINT [ "/usr/bin/ftp-entrypoint.sh" ]

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
