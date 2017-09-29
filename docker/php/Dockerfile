FROM php:5.6-fpm 
MAINTAINER Ádám Barancsuk <adam.barancsuk@gmail.com>

RUN apt-get update -y && apt-get install -y \
  php5-mapscript \
  supervisor
RUN docker-php-ext-install mysqli
