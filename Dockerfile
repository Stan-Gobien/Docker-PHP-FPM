FROM php:8-fpm

RUN echo nameserver 1.1.1.1 > /etc/resolv.conf

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN IPE_GD_WITHOUTAVIF=1 && chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd gettext mysqli apcu exif mcrypt mbstring xml

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install ssmtp
