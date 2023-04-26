#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo sed -i 's/deb.debian.org/tw1.mirror.blendbyte.net/g' /etc/apt/sources.list      
sudo timedatectl set-timezone Asia/Taipei
sudo apt-get update
sudo apt-get --quiet --yes dist-upgrade
sudo apt-get --quiet --yes install git vim curl wget htop tmux jq net-tools

cp -v /vagrant/.vimrc ~/.vimrc
cp -v /vagrant/.tmux.conf ~/.tmux.conf