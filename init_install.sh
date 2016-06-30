#!/usr/bin/env bash

# add source lists
sudo cp ./sourcelist/*.list /etc/apt/sources.list.d/

# Update the system
sudo apt-get -y update
sudo apt-get -y dist-upgrade

sudo apt-get -y install \
    vim \
    #vim-nox-py2 \
    zsh \
    openssh-server \
    build-essential \
    git \
    rar \
    unrar \
    tofrodos \
    curl \
    imagemagick \
    phpmyadmin \
    python-pip \
    python-vte \
    gimp \
    p7zip \
    ibus-sunpinyin \
    python-notify \
    #miredo \

## PPA
# ffmpeg
#sudo add-apt-repository -y ppa:jon-severinsson/ffmpeg
#sudo apt-get -y update
#sudo apt-get -y install ffmpeg

# java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get -y install oracle-java8-installer oracle-java8-set-default

# change default sh (The Last One)
chsh -s /bin/zsh
echo "Please logout to make default shell options work!"
