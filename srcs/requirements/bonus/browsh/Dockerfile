FROM debian:stable-20230411 as build

RUN apt update && apt install -y \
      curl \
      ca-certificates \
      git \
      autoconf \
      automake \
      g++ \
      protobuf-compiler \
      zlib1g-dev \
      libncurses5-dev \
      libssl-dev \
      pkg-config \
      libprotobuf-dev \
      make \
      bzip2 \
	  && rm -rf /var/lib/apt/lists/*

# Helper scripts
WORKDIR /build
ADD tools/scripts scripts
ADD tools/ctl.sh .

# Install Golang and Browsh
ENV GOROOT=/go
ENV GOPATH=/go-home
ENV PATH=$GOROOT/bin:$GOPATH/bin:$PATH
ENV BASE=$GOPATH/src/browsh/interfacer
ADD tools/interfacer $BASE
WORKDIR $BASE
RUN /build/ctl.sh install_golang $BASE
RUN /build/ctl.sh build_browsh_binary $BASE

###########################
# Actual final Docker image
###########################
FROM debian:stable-20230411

ENV HOME=/app
WORKDIR $HOME

COPY --from=build /go-home/src/browsh/interfacer/browsh /app/bin/browsh

RUN apt update && apt install -y \
      xvfb \
      libgtk-3-0 \
      curl \
      ca-certificates \
      libdbus-glib-1-2 \
      procps \
      libasound2 \
      libxtst6 \
      firefox-esr \
	  && rm -rf /var/lib/apt/lists/*

# Block ads, etc. This includes porn just because this image is also used on the
# public SSH demo: `ssh brow.sh`.
RUN curl \
  -o /etc/hosts \
  https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts

# Don't use root
RUN useradd -m user --home /app
RUN chown user:user /app
USER user

ENV PATH="${HOME}/bin:${HOME}/bin/firefox:${PATH}"

# Firefox behaves quite differently to normal on its first run, so by getting
# that over and done with here when there's no user to be dissapointed means
# that all future runs will be consistent.
RUN TERM=xterm script \
  --return \
  -c "/app/bin/browsh" \
  /dev/null \
  >/dev/null & \
  sleep 10

ENTRYPOINT ["tail", "-f", "/dev/null"]
