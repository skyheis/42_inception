NAME = inception

LOCATION = -f ./srcs/docker-compose.yml

all: keygen $(NAME)

$(NAME): build
	docker-compose $(LOCATION) up

deamon: build
	docker-compose $(LOCATION) up -d

build:
	docker-compose $(LOCATION) build

clean:
	docker-compose $(LOCATION) down

fclean: clean
	docker-compose $(LOCATION) down --rmi all
	rm -r ~/database/*
	rm -r ~/wordpress/*

re: fclean all

redeamon: fclean deamon

browsh:
	docker container exec -it ggiannit_browsh links2 https://ggiannit_nginx/

keygen:
	@mkdir -p /root/certs/private
	@mkdir -p /root/certs/certs
	@echo "Generating the cert and the key in /root/certs if not present"
	if [ ! -f "/root/certs/private/ggiannit.42.fr.key" ]; then \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=IT/ST=Italy/L=Florence/O=42/OU=42Firenze/CN=ggiannit.42.fr" \
		-keyout /root/certs/private/ggiannit.42.fr.key \
		-out /root/certs/certs/ggiannit.42.fr.crt; \
	fi
	@cp /root/certs/certs/ggiannit.42.fr.crt /var/tmp
	@chmod 444 /var/tmp/ggiannit.42.fr.crt

delkey:
	@echo "Deleting the cert and the key in /root/certs"
	@rm -r /root/certs/private
	@rm -r /root/certs/certs

.PHONY: all build clean fclean re browsh deamon
