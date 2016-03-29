#!/bin/bash

#############################
## Install docker on linux ##
#############################

# following the official guide here (accessed on 14/03/2016):
# https://docs.docker.com/linux/step_one/

# Having curl installed is a requirement.
# Must use OS dependent instructions to install it, before calling this script.

echo "installing docker ..."

# Add Docker PGP key
curl -fsSL https://get.docker.com/gpg | apt-key add -

# Run Docker installation script
curl -fsSL https://get.docker.com/ | sh

echo "done installing docker."
