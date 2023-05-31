NAME = inception

LOCATION = -f ./srcs/docker-compose.yml

all: $(NAME)

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

.PHONY: all build clean fclean re browsh deamon
