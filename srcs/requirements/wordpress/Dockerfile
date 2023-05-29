FROM debian:stable-20230411

RUN apt-get update && apt-get install -y \
 	php7.3 php7.3-mysql php7.3-fpm php7.3-curl php7.3-gd \
	php7.3-intl php7.3-mbstring php7.3-soap php7.3-xml \
	php7.3-xmlrpc php7.3-zip wget vim \
 	&& rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN cp /etc/php/7.3/fpm/pool.d/www.conf /tmp/www.conf

COPY tools/wp-entrypoint.sh /opt/wp-entrypoint.sh

RUN chmod +x /opt/wp-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "/opt/wp-entrypoint.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
# CMD [ "/bin/bash" ]
