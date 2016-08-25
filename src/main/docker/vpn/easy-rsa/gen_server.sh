#!/bin/bash

srvname="server"
echo -e "\nCreating $srvname"
docker run -i --rm --name easy-rsa  \
 -v "$( cd "$( dirname "$0" )" && pwd )"/keys:/easy-rsa \
 -v "$( cd "$( dirname "$0" )" && pwd )"/build-ca:/er/build-ca  \
 -v "$( cd "$( dirname "$0" )" && pwd )"/build-key:/er/build-key    \
 -v "$( cd "$( dirname "$0" )" && pwd )"/build-key-server:/er/build-key-server  \
 --env-file "$( cd "$( dirname "$0" )" && pwd )"/vars   \
 isartcanyameres/easyrsa-2.x /er/build-key-server $srvname
