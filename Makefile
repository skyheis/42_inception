all: $(NAME)

$(NAME): build
	docker-compose up

deamon: build
	docker-compose up -d

build: cddir
	docker-compose build

clean: cddir
	docker-compose down

fclean: clean
	docker-compose down --rmi all
	rm -r ~/database/*
	rm -r ~/wordpress/*

re: fclean all

redeamon: fclean deamon

cddir:
	cd srcs
