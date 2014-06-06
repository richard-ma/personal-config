#!/usr/bin/env bash

sudo apt-get -y install \
    vim \
    zsh \
    openssh-server \
    build-essential \
    fpc \
    openjdk-7-jre-headless \
    git \
    subversion \
    rar \
    unrar \
    tofrodos \
    curl \
    imagemagick \
    apache2 \
    php5 \
    libapache2-mod-php5 \
    mysql-server \
    libapache2-mod-auth-mysql \
    php5-mysql \
    php5-curl \
    php-pear \
    phpmyadmin \
    python-pip \
    python-vte \
    gimp \
    miredo \
    exuberant-ctags

# change default sh (The Last One)
chsh -s /bin/zsh
echo "Please logout to make default shell options work!"
