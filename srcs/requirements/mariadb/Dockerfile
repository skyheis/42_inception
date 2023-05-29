FROM debian:stable-20230411

# ARG root_passwd

# ENV MYSQL_ROOT_PASSWORD=totiroti
# ENV MYSQL_DATABASE=wordpress
# ENV MYSQL_USER=ggiannit
# ENV MYSQL_PASSWORD=culocane

# RUN apt-get update && apt-get install -y \
# 	mariadb-server mariadb-client \
# 	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

COPY tools/mariadb-entrypoint.sh /usr/bin/mariadb-entrypoint.sh
COPY tools/mariadb-entrypoint.sh /usr/bin/gigidb-secure-installation
RUN chmod +x /usr/bin/gigidb-secure-installation
RUN chmod +x /usr/bin/mariadb-entrypoint.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD [ "/bin/bash" ]

# ENTRYPOINT [ "/usr/bin/mariadb-entrypoint.sh" ]

# CMD ["mysqld"]
