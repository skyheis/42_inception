FROM debian:stable-20230411

RUN apt-get update && apt-get install -y \
 	php7.4 php7.4-mysql php7.4-fpm php7.4-curl php7.4-gd \
	php7.4-intl php7.4-mbstring php7.4-soap php7.4-xml \
	php7.4-xmlrpc php7.4-zip wget mariadb-client \
 	&& rm -rf /var/lib/apt/lists/*

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html && \
	wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

RUN service php7.4-fpm start && service php7.4-fpm stop

CMD ["/usr/sbin/php-fpm7.4", "-F"]
