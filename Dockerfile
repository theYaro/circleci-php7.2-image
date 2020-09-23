FROM circleci/php:7.3-node-browsers

MAINTAINER yaroslav@shvetsov.ru

USER root

RUN apt-get update

RUN docker-php-ext-install zip pdo_mysql

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
RUN apt-get install mysql-client
