FROM php:8-fpm

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN IPE_GD_WITHOUTAVIF=1 && chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd gettext mysqli apcu exif mcrypt

RUN apt-get update &&  \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install msmtp && \
    apt-get clean && \
    echo 'sendmail_path="/usr/bin/msmtp --from=docker-`id -u` -ti"' > /usr/local/etc/php/conf.d/mail.ini
