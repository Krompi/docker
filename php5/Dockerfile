FROM krompi/base
MAINTAINER Krompi

#
# Set environment variables
#
ENV DEBIAN_FRONTEND=noninteractive

#
# User
#
RUN groupmod -g 1000 www-data && \
    usermod -u 1000 www-data

#
# APT packages
#
RUN apt-get update && apt-get install -y \
    software-properties-common

RUN add-apt-repository ppa:ondrej/php

RUN apt-get update && apt-get install -y \
    php5.6-bcmath \
    php5.6-cli \
    php5.6-common \
    php5.6-dom \
    php5.6-curl \
    php5.6-fpm \
    php5.6-gd \
    php5.6-imap \
    php5.6-intl \
    php5.6-json \
    php5.6-ldap \
    php5.6-mbstring \
    php5.6-mcrypt \
    php5.6-mysql \
    php5.6-pgsql \
    php5.6-phpdbg \
    php5.6-readline \
    php5.6-soap \
    php5.6-sqlite3 \
    php5.6-xml \
    php5.6-xmlrpc \
    php5.6-zip

#
# Configuration
#
COPY www.conf /etc/php/5.6/fpm/pool.d/www.conf
COPY php.ini /etc/php/5.6/mods-available/php.ini

RUN ln -s /etc/php/5.6/mods-available/php.ini /etc/php/5.6/cli/conf.d/90-php.ini && \
    ln -s /etc/php/5.6/mods-available/php.ini /etc/php/5.6/fpm/conf.d/90-php.ini && \
    ln -s /etc/php/5.6/mods-available/php.ini /etc/php/5.6/phpdbg/conf.d/90-php.ini && \
    mkdir -p /run/php

#
# Composer
#
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

#
# Reset environment variables
#
ENV DEBIAN_FRONTEND=

#
# Ports
#
EXPOSE 4000 8000 9000

#
# Command
#
CMD ["php-fpm5.6", "-F"]
