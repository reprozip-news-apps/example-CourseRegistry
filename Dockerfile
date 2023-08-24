FROM php:5.6-apache

RUN docker-php-ext-install pdo pdo_mysql
COPY . /var/www/html/
COPY apache-site.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
