FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
        software-properties-common \
        ca-certificates \
        apt-transport-https \
        lsb-release \
        sudo \
        vim \
        zip \
        unzip && \
    add-apt-repository ppa:ondrej/php -y && \
    apt update -y && \
    apt install -y \
        apache2 \
        php8.3 \
        libapache2-mod-php8.3 \
        php8.3-mysql \
        php8.3-gd \
        php8.3-curl \
        php8.3-mbstring \
        php8.3-xml \
        php8.3-zip \
        php8.3-intl \
        php8.3-bcmath \
        php8.3-opcache && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY xenforo/ .

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]