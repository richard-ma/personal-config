#!/usr/bin/env bash

# update the system
sudo apt-get update && sudo apt-get dist-upgrade

sudo apt-get -y install \
    vim \
    zsh \
    build-essential \
    fpc \
    git \
    subversion \
    rar \
    unrar \
    imagemagick \
    apache2 \
    php5 \
    libapache2-mod-php5 \
    mysql-server \
    libapache2-mod-auth-mysql \
    php5-mysql \
    phpmyadmin \
    gnome-shell \
    python-pip 

# Python Pip
#sudo pip install docutils

# change default sh (The Last One)
#chsh -s /bin/zsh
#echo "Please logout to make default shell options work!"
