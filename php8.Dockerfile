# https://github.com/mlocati/docker-php-extension-installer
FROM php:8.1-apache
    
RUN apt-get update && apt-get install -y cron git-core jq unzip vim zip \
	libjpeg-dev libpng-dev libpq-dev libsqlite3-dev libwebp-dev libzip-dev && \
	rm -rf /var/lib/apt/lists/* && \
	docker-php-ext-configure zip --with-zip && \
	docker-php-ext-configure gd --with-jpeg --with-webp && \
	docker-php-ext-install exif gd mysqli opcache pdo_pgsql pdo_mysql zip
    
RUN a2enmod rewrite
RUN sed -ri 's/^www-data:x:82:82:/www-data:x:1000:50:/' /etc/passwd
RUN chown -R www-data:www-data /var/www/html
