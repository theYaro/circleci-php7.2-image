FROM circleci/php:7.3-node-browsers

MAINTAINER yaroslav@shvetsov.ru

USER root

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y \
    libpng-dev \
	libfreetype6-dev \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxpm-dev \
    libgmp-dev \
	libfreetype6-dev

RUN docker-php-ext-configure gd \
	--with-gd \
    --with-webp-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-zlib-dir=/usr/include/ \
    --with-xpm-dir=/usr/include/ \
    --with-freetype-dir \
    --enable-gd-native-ttf

RUN docker-php-ext-install \
    zip \
    pdo_mysql \
    bcmath \
    gd

RUN apt-get install -y \
	software-properties-common \
	vim \
	python-pip

# Install ansible
RUN pip install ansible

# Install php deployer
RUN curl -LO https://deployer.org/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep

# Install MySQL client
RUN apt-get install default-mysql-client
