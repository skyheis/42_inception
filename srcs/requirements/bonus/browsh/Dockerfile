FROM debian:stable-20230411

RUN apt-get update && apt-get install -y \
 	wget firefox-esr inetutils-ping\
 	&& rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/browsh-org/browsh/releases/download/v1.8.0/browsh_1.8.0_linux_amd64.deb

RUN dpkg -i browsh_1.8.0_linux_amd64.deb

CMD ["/bin/ping", "127.0.0.1"]
