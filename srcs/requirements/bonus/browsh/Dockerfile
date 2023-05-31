FROM debian:stable-20230411

RUN apt-get update && apt-get install -y \
 	links2 \
 	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sleep", "infinity"]
