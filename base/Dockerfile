FROM ubuntu:16.04

MAINTAINER Krompi
#
# APT packages
#
RUN apt-get update && apt-get install -y \
    curl \
    git \
    less \
    locales \
    nano \
    openssl \
    ssl-cert \
    wget \
    vi

RUN rm -rf /var/lib/apt/lists/*

#
# Configuration
#
RUN locale-gen $LANG && \
    update-locale LANG=$LANG

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

#
# Reset environment variables
#
ENV DEBIAN_FRONTEND=
