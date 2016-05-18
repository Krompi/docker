# akilli/postgres

`akilli/base` based PostgreSQL image

## Usage

In your `docker-compose.yml` include something like

    version: '2'
    services:
        postgres:
            image: akilli/postgres
            ports:
                - "5432:5432"

or with a separate data volume

    version: '2'
    volumes:
        postgresdata: {}
    services:
        postgres:
            image: akilli/postgres
            ports:
                - "5432:5432"
            volumes:
                - postgresdata:/var/lib/postgresql
