FROM php:7.1.10-apache

RUN apt-get update && apt-get install -y vim git

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

RUN a2enmod rewrite

WORKDIR /var/www
RUN composer require slim/slim "^3.0"

WORKDIR /var/www/html
COPY ./src .

EXPOSE 80
CMD ["apache2-foreground"]
