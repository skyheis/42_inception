FROM debian:stable-20230411

# ARG root_passwd

# ENV MYSQL_ROOT_PASSWORD=${root_passwd}

RUN apt-get update && apt-get install -y \
	mariadb-server mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

COPY tools/mariadb-entrypoint.sh /usr/bin/mariadb-entrypoint.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod u+x /usr/bin/mariadb-entrypoint.sh
# COPY  tools/gigidb-secure-installation /usr/bin/gigidb-secure-installation
# RUN chmod u+x /usr/bin/gigidb-secure-installation && \
# 	service mariadb start && \
# 	/usr/bin/gigidb-secure-installation

EXPOSE 3306

ENTRYPOINT [ "mariadb-entrypoint.sh" ]
