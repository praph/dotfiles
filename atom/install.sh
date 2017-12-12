#!/bin/sh
apt-get update  # To get the latest package lists
wget https://github.com/atom/atom/releases/download/v1.22.1/atom-amd64.deb
dpkg -i atom-amd64.deb
