FROM alpine AS build-env

MAINTAINER Shigure Onishi <iwanomoto@gmail.com>

ENV PACKER_VERSION=1.2.4 \
    PACKER_POST_PROCESSOR_AMAZON_LAUNCHCONFIGURATION_VERSION=v0.0.5

RUN adduser -D packer \
    && mkdir /tmp/packer \
    && cd /tmp/packer \
    && apk add --update curl ca-certificates openssh-client unzip wget \
    && curl -O -sS -L https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip packer_${PACKER_VERSION}_linux_amd64.zip \
    && mv packer* /usr/bin \
    && cd /tmp \
    && wget https://github.com/a4t/packer-post-processor-amazon-launchconfiguration/releases/download/${PACKER_POST_PROCESSOR_AMAZON_LAUNCHCONFIGURATION_VERSION}/packer-post-processor-amazon-launchconfiguration-${PACKER_POST_PROCESSOR_AMAZON_LAUNCHCONFIGURATION_VERSION}-linux-amd64.zip \
    && unzip /tmp/packer-post-processor-amazon-launchconfiguration-${PACKER_POST_PROCESSOR_AMAZON_LAUNCHCONFIGURATION_VERSION}-linux-amd64.zip \
    && mv /tmp/linux-amd64/packer-post-processor-amazon-launchconfiguration /usr/bin

FROM busybox
COPY --from=build-env /usr/bin/packer-post-processor-amazon-launchconfiguration /usr/bin/packer-post-processor-amazon-launchconfiguration
COPY --from=build-env /usr/bin/packer /usr/bin/packer
RUN adduser -D packer
USER packer
