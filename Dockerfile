FROM alpine

ARG VERSION=v12.5.0
RUN apk add --update git ca-certificates nodejs npm

RUN npm i -g commit-and-tag-version@${VERSION}

ADD plugin.sh /bin/
RUN chmod +x /bin/entrypoint.sh


WORKDIR /src

ENTRYPOINT /bin/entrypoint.sh

