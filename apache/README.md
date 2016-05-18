# akilli/apache

`akilli/base` based Apache HTTP Server image

## Usage

In your `docker-compose.yml` include something like

    version: '2'
    services:
        app:
            image: akilli/base
            volumes:
                - .:/var/www/html
        php:
            image: akilli/php
            ports:
                - "4000:4000"
                - "8000:8000"
                - "9000:9000"
            volumes_from:
                - app
        apache:
            image: akilli/apache
            ports:
                - "80:80"
                - "443:443"
            volumes_from:
                - app

Then browse to `http://localhost` or `https://localhost`

**NOTE**
The included default site configuration file sets a PHP handler at `php:9000`, so either make sure a PHP FPM or HHVM
container is accessible at this address and port or just overwrite the default site configuration file
