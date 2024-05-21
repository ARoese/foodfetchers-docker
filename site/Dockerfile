FROM php:8.2-apache
RUN apt update && apt install -y libpq-dev
RUN docker-php-ext-install pdo_pgsql pgsql
RUN apt clean

COPY ./html/ /var/www/html
COPY ./config/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./config/php.ini /usr/local/etc/php/php.ini