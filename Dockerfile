FROM docker:1.12

ENV COMPOSE_VERSION 1.8.1

RUN apk add --no-cache \
		git \
		openssh-client \
        curl

RUN curl -L https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

