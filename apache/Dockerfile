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
    apache2

RUN rm -rf /var/lib/apt/lists/*

#
# Configuration
#
RUN rm /etc/apache2/sites-enabled/* && \
    rm /etc/apache2/sites-available/*

COPY default.conf /etc/apache2/sites-available/default.conf

RUN a2ensite default && \
    a2dismod mpm_event && \
    a2enmod macro mpm_worker proxy proxy_fcgi rewrite ssl vhost_alias

#
# Reset environment variables
#
ENV DEBIAN_FRONTEND=

#
# Volumes
#
VOLUME ["/var/www/html"]

#
# Ports
#
EXPOSE 80 443

#
# Command
#
CMD ["apache2ctl", "-D", "FOREGROUND"]
