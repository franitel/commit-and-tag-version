FROM alpine

ARG VERSION=v12.5.0
RUN apk add --update --no-cache git ca-certificates nodejs npm openssh

RUN npm i -g commit-and-tag-version@${VERSION}

ADD entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh


WORKDIR /src

ENTRYPOINT /bin/sh
#ENTRYPOINT /bin/entrypoint.sh

