#!/usr/bin/env bash

# add source lists
sudo cp ./sourcelist/*.list /etc/apt/sources.list.d/

# Update the system
sudo apt-get -y update && sudo apt-get -y dist-upgrade

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
    exuberant-ctags \
    p7zip \
    google-chrome-stable

## PPA
# ffmpeg
sudo add-apt-repository -y ppa:jon-severinsson/ffmpeg
sudo apt-get -y update
sudo apt-get -y install ffmpeg

# change default sh (The Last One)
chsh -s /bin/zsh
echo "Please logout to make default shell options work!"
