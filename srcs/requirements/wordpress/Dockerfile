FROM debian:stable-20230411

# RUN apt-get update && apt-get install -y \
#  	php7.4 php7.4-mysql php7.4-fpm php7.4-curl php7.4-gd \
# 	php7.4-intl php7.4-mbstring php7.4-soap php7.4-xml \
# 	php7.4-xmlrpc php7.4-zip wget vim \
#  	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
	php8.2-fpm php8.2-common php8.2-mysql \
	php8.2-xml php8.2-xmlrpc php8.2-curl php8.2-gd \
	php8.2-imagick php8.2-cli php8.2-dev php8.2-imap \
	php8.2-mbstring php8.2-opcache php8.2-redis \
	php8.2-soap php8.2-zip \
	&& rm -rf /var/lib/apt/lists/*

RUN cp /etc/php/8.2/fpm/pool.d/www.conf /tmp/www.conf
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/wp-entrypoint.sh /opt/wp-entrypoint.sh

RUN chmod +x /opt/wp-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "/opt/wp-entrypoint.sh" ]

# CMD ["/usr/sbin/php-fpm7.4", "-F"]
CMD ["/usr/sbin/php-fpm8.0", "-F"]
# CMD [ "/bin/bash" ]
