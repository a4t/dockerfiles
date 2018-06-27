FROM alpine

MAINTAINER Shigure Onishi <iwanomoto@gmail.com>

RUN \
  apk update && \
  apk add --no-cache autossh && \
  adduser proxy -D && \
  mkdir /home/proxy/.ssh && \
  echo -e "host *\n  StrictHostKeyChecking no" > /home/proxy/.ssh/config && \
  chown -R proxy:proxy /home/proxy

ADD ./entrypoint.sh /entrypoint.sh

USER proxy

ENTRYPOINT ["/entrypoint.sh"]
