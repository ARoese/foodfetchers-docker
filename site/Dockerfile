FROM php:8.2-apache
RUN apt update && apt install -y libpq-dev zip
RUN docker-php-ext-install pdo_pgsql pgsql
RUN apt clean
#COPY ./html/ /var/www/html
#WORKDIR /var/www/html
#RUN php composer.phar install