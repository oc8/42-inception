FROM alpine:3.14.3
RUN apk update && apk upgrade
RUN apk add --update php7-fpm php7-json php7-zlib php7-xml php7-xmlwriter php7-simplexml php7-pdo php7-phar php7-openssl \
    php7-pdo_mysql php7-mysqli php7-session \
    php7-gd php7-iconv php7-mcrypt php7-gmp php7-zip \
    php7-curl php7-opcache php7-ctype php7-apcu \
    php7-intl php7-bcmath php7-dom php7-mbstring php7-xmlreader bash tar curl wget mysql-client mysql openrc util-linux git make
COPY tools/install.sh ./
COPY tools/www.conf /etc/php7/php-fpm.d/www.conf
COPY tools/php-fpm.conf /etc/php7/php-fpm.conf

EXPOSE 9000
RUN chmod -x install.sh

CMD ["/bin/bash", "/install.sh"]
