#!/bin/bash

#####################################
## Install docker on ubuntu trusty ##
#####################################

# following the official guide here (accessed on 14/03/2016):
# https://docs.docker.com/engine/installation/linux/ubuntulinux/

echo "updating docker apt sources ..."

# ensure that APT works with the https method, and that CA certificates are installed.
apt-get update
apt-get install apt-transport-https ca-certificates

# Add docker PGP key
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add docker packages repo for ubuntu-trusty
touch /etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update

# Uninstall old repo if it exists (it does not in the clean ubuntu/trusty64)
apt-get purge lxc-docker


echo "installing docker prerequisites ..."

# For Ubuntu Trusty, it’s recommended to install the linux-image-extra kernel package.
# The linux-image-extra package allows you use the aufs storage driver.
apt-get install linux-image-extra-$(uname -r) -y

# If you are installing on Ubuntu 14.04, apparmor is required (already installed in ubuntu/trusty64)
apt-get install apparmor

echo "installing docker ..."

# Install Docker
apt-get update
apt-get install docker-engine -y

# Start docker daemon
service docker start

echo "done installing docker."
