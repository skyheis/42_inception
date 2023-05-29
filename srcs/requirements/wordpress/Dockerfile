FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-json \
    php8-curl \
    php8-dom \
    php8-exif \
    php8-fileinfo \
    php8-mbstring \
    php8-openssl \
    php8-xml \
    php8-zip \
    php8-redis \
	wget \
    rm -f /var/cache/apk/*
# FROM debian:stable-20230411

# # RUN apt-get update && apt-get install -y \
# #  	php7.4 php7.4-mysql php7.4-fpm php7.4-curl php7.4-gd \
# # 	php7.4-intl php7.4-mbstring php7.4-soap php7.4-xml \
# # 	php7.4-xmlrpc php7.4-zip wget vim \
# #  	&& rm -rf /var/lib/apt/lists/*

# RUN apt update && apt install -y wget && wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
# RUN echo "deb https://packages.sury.org/php/ bullseye main" | tee /etc/apt/sources.list.d/sury-php.list
# RUN apt-get update && apt-get install -y \
# 	php8.0-fpm php8.0-common php8.0-mysql \
# 	php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd \
# 	php8.0-imagick php8.0-cli php8.0-dev php8.0-imap \
# 	php8.0-mbstring php8.0-opcache php8.0-redis \
# 	php8.0-soap php8.0-zip \
# 	&& rm -rf /var/lib/apt/lists/*

RUN cp /etc/php/8.0/fpm/pool.d/www.conf /tmp/www.conf
COPY conf/www.conf /etc/php/8.0/fpm/pool.d/www.conf

COPY tools/wp-entrypoint.sh /opt/wp-entrypoint.sh

RUN chmod +x /opt/wp-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "/opt/wp-entrypoint.sh" ]

# CMD ["/usr/sbin/php-fpm7.4", "-F"]
CMD ["/usr/sbin/php-fpm8.0", "-F"]
# CMD [ "/bin/bash" ]
