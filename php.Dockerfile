FROM php:7.4.3-apache
RUN a2enmod rewrite
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN sed -ri 's/^www-data:x:82:82:/www-data:x:1000:50:/' /etc/passwd
RUN chown -R www-data:www-data /var/www/html
