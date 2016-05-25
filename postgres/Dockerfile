FROM krompi/base
MAINTAINER Krompi

#
# Set environment variables
#
ENV DEBIAN_FRONTEND=noninteractive \
    PG_MAJOR=9.5

#
# APT packages
#
RUN apt-get update && apt-get install -y \
    postgresql-$PG_MAJOR \
    postgresql-contrib-$PG_MAJOR

RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/postgresql && \
    mkdir -p /var/lib/postgresql && \
    mkdir -p /var/run/postgresql/$PG_MAJOR-main.pg_stat_tmp && \
    chown postgres:postgres /var/run/postgresql/$PG_MAJOR-main.pg_stat_tmp

#
# Configuration
#
RUN echo "host all all 0.0.0.0/0  trust" >> /etc/postgresql/$PG_MAJOR/main/pg_hba.conf && \
    echo "listen_addresses='*'" >> /etc/postgresql/$PG_MAJOR/main/postgresql.conf

#
# Reset environment variables
#
ENV DEBIAN_FRONTEND=

#
# Volumes
#
VOLUME ["/var/lib/postgresql"]

#
# Ports
#
EXPOSE 5432

#
# Command
#
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
