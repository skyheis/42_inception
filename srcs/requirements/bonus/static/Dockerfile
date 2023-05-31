FROM debian:stable-20230411

RUN apt-get update && apt-get install -y \
	nginx\
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 80

COPY ./conf/portfolio.conf /etc/nginx/conf.d

COPY ./conf/portfolio /tmp/portfolio

RUN mv /tmp/portfolio/* /usr/share/nginx/html

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log


CMD ["nginx", "-g", "daemon off;"]
