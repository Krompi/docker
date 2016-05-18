#!/bin/bash

set -e

chown -R postgres:postgres /var/lib/postgresql
chown -R postgres:postgres /run/postgresql

if [ -z "$(ls -A /var/lib/postgresql)" ]; then
    su postgres -c "mkdir -p /var/lib/postgresql/$PG_MAJOR/main"
    su postgres -c "/usr/lib/postgresql/$PG_MAJOR/bin/initdb -D /var/lib/postgresql/$PG_MAJOR/main -E UTF8"
    su postgres -c "/usr/lib/postgresql/$PG_MAJOR/bin/postgres --single --config-file=/etc/postgresql/$PG_MAJOR/main/postgresql.conf" <<< "ALTER USER postgres WITH PASSWORD '';" > /dev/null
fi

su postgres -c "/usr/lib/postgresql/$PG_MAJOR/bin/postgres --config-file=/etc/postgresql/$PG_MAJOR/main/postgresql.conf"
