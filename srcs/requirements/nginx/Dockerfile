FROM debian:stable-20230411

RUN apt-get update && apt-get install -y \
	nginx openssl\
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY ./conf/ggiannit.42.conf /etc/nginx/conf.d

COPY ${CERT_DIR}/private/ggiannit.42.fr.key /etc/ssl/private/
COPY ${CERT_DIR}/certs/ggiannit.42.fr.key /etc/ssl/certs/

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 	-subj "/C=IT/ST=Italy/L=Florence/O=42/OU=42Firenze/CN=ggiannit.42.fr" \
# 	-keyout /etc/ssl/private/ggiannit.42.fr.key \
# 	-out /etc/ssl/certs/ggiannit.42.fr.crt

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN rm /etc/nginx/sites-enabled/default && \
	rm /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
