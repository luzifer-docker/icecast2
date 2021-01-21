FROM alpine:3.8

LABEL maintainer Knut Ahlers <knut@ahlers.me>

ENV DUMB_INIT_VERSION=1.2.2 \
    GOSU_VERSION=1.11

RUN set -ex \
 && apk --no-cache add \
      bash \
      curl \
      icecast \
      mailcap \
 && curl -sSfLo /usr/bin/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64" \
 && curl -sSfLo /usr/bin/gosu "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" \
 && chmod 0755 \
      /usr/bin/dumb-init \
      /usr/bin/gosu

VOLUME /config
EXPOSE 8000 8001

ADD startup.sh /usr/bin/startup.sh

ENTRYPOINT ["/usr/bin/startup.sh"]

# healthcheck
HEALTHCHECK CMD curl -sL --fail localhost:8000 || exit 1
