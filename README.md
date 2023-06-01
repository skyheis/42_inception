# Inception

## Introduction
This project was about creating a docker-compose with relative Dockerimage for a simple LAMP stack.

## Considerations
As a system administrator, I didn't have trouble to do this project, I already had a good knowledge of docker and docker-compose, I also had a good knowledge of the services used in this project. But I think this project is a good way to learn how to use docker and docker-compose, it's a good way to learn how to use the dockerfile and the docker-compose.yml file. 

Without a previous knowledge of system administration it's hard to understand how to use install and configure every the dockerfile and configure every service.

My advice is to learn how to use docker and docker-compose before starting this project, by doing some tutorials and reading the documentation.

Then you should try to install the services on a virtual machine and try to configure them. When you have a good knowledge of the services you can start the project and you will have a better understanding of what you are doing, converting the configuration files in dockerfile and docker-compose.yml file will be easier.

## Technologies
All the images are based on Debian, the Dockerimage are build with Dockerfile.
The diffrent images are:
- nginx: web server and proxy manager
- phpfpm and wordpress: php processor
- mariadb: database
- adminer: database manager
- redis: cache server
- ftp: vsftp server
- static: static website with nginx in http, the connection are redirected from nginx.
- browsh: a text based browser to test the connection (it was a bonus of our choice)
  
## How to use
To use this project you need to have openssl, docker and docker-compose installed on your machine.
You need to set the local volumes in directory of your choice, the volumes are:
- wordpress
- mariadb
- certs
You have to replace the path in the docker-compose.yml file with your own path.
You can also change the ports in the docker-compose.yml file.
To start the project you need to run the command:
```bash
	make
```
This will create the certs, build the images and start the containers.

To stop the project you need to run the command:
```bash
	make clean
```
this will delete the containers.

To delete the project you need to run the command:
```bash
	make fclean
```
this will delete the containers, the images and the volumes content.

## Roadmap
Check the subject for more informations.
