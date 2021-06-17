FROM php:7.4-apache

RUN docker-php-source extract \
    && apt-get update \
    && apt-get install -y libmagickwand-dev libpng-dev libldap2-dev vim curl unzip --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-install pdo pdo_mysql mysqli gd \
    && docker-php-ext-enable imagick \
    && a2enmod rewrite \
    && sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf \
    && service apache2 restart \
    && docker-php-source delete \
    && apt-get clean \ 
    && apt-get autoclean \ 
    && apt-get autoremove --purge -y \ 
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*