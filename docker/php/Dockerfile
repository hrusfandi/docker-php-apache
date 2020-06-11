FROM php:7.2-fpm-alpine3.9
RUN apk update; \
    apk upgrade;

RUN set -ex \
  && apk --no-cache add \
    postgresql-dev

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN apk update

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd xdebug pdo pdo_pgsql intl

# RUN docker-php-ext-install pdo pdo_pgsql

COPY --from=composer /usr/bin/composer /usr/bin/composer