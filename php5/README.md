# akilli/php

`akilli/base` based PHP image.

# Supported tags and respective `Dockerfile` links

- [`5.6` (*5.6/Dockerfile*)](https://github.com/akilli/docker/blob/master/php5/Dockerfile)
- [`7.0`, `latest` (*7.0/Dockerfile*)](https://github.com/akilli/docker/blob/master/php/Dockerfile)

## Usage

In your `docker-compose.yml` include something like

    version: '2'
    services:
        php:
            image: akilli/php
            ports:
                - "4000:4000"
                - "8000:8000"
                - "9000:9000"
