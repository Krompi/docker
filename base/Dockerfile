FROM ubuntu:16.04

MAINTAINER Krompi

#
# Set environment variables
#
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=de_DE.UTF-8 \
    TERM=xterm \
    TZ=Europe/Berlin
#ENV http_proxy http://10.167.16.21:80
#ENV https_proxy http://10.167.16.21:80

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
    vi vim
