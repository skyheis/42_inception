FROM debian:stable-20230411

RUN		apt-get update
RUN		apt-get install -y redis php-redis \
		&& rm -rf /var/lib/apt/lists/*

COPY ./tools/redis-entrypoint.sh /tmp/redis-entrypoint.sh

RUN chmod +x /tmp/redis-entrypoint.sh

EXPOSE 6379

ENTRYPOINT [ "/tmp/redis-entrypoint.sh" ]

CMD [ "/usr/bin/redis-server", "--protected-mode no" ]
