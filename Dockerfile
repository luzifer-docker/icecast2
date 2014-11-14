From ubuntu:14.04
MAINTAINER Knut Ahlers <knut@ahlers.me>

RUN apt-get update && \
    apt-get install -y icecast2

VOLUME /etc/icecast2/icecast.xml
EXPOSE 8000 8001

USER icecast2

ENTRYPOINT ["/usr/bin/icecast2", "-c", "/etc/icecast2/icecast.xml"]
