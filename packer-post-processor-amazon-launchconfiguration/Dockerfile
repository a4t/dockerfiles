FROM alpine

MAINTAINER Shigure Onishi <iwanomoto@gmail.com>

ENV PACKER_VERSION 1.2.4

RUN adduser -D packer \
    && mkdir /tmp/packer \
    && cd /tmp/packer \
    && apk add --update curl ca-certificates openssh-client unzip wget \
    && curl -O -sS -L https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip packer_${PACKER_VERSION}_linux_amd64.zip \
    && mv packer* /usr/bin \
    && cd /tmp \
    && wget https://github.com/a4t/packer-post-processor-amazon-launchconfiguration/releases/download/v0.0.5/packer-post-processor-amazon-launchconfiguration-v0.0.5-linux-amd64.zip \
    && unzip /tmp/packer-post-processor-amazon-launchconfiguration-v0.0.5-linux-amd64.zip \
    && mv /tmp/linux-amd64/packer-post-processor-amazon-launchconfiguration /usr/bin \
    && chmod 744 /usr/bin/packer-post-processor-amazon-launchconfiguration \
    && chown packer:packer /usr/bin/packer-post-processor-amazon-launchconfiguration \
    && apk del unzip \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/packer \
    && rm -rf /tmp/packer-post-processor-amazon-launchconfiguration-v0.0.5-linux-amd64.zip \
    && rm -rf /tmp/linux-amd64

USER packer

