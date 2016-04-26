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
    git \
    rar \
    unrar \
    tofrodos \
    curl \
    imagemagick \
    php-mbstring \
    php-gettext \
    phpmyadmin \
    python-pip \
    python-vte \
    gimp \
    #miredo \
    p7zip \
    ibus-sunpinyin \
    openjdk-9-jre-headless \
    python-notify \

## PPA
# ffmpeg
#sudo add-apt-repository -y ppa:jon-severinsson/ffmpeg
#sudo apt-get -y update
#sudo apt-get -y install ffmpeg

# change default sh (The Last One)
chsh -s /bin/zsh
echo "Please logout to make default shell options work!"
