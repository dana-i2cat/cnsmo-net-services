#!/bin/bash

echo -e "Generating Index and serial"
sh "$( cd "$( dirname "$0" )" && pwd )"/gen_index.sh
echo -e "Generating CA certificate and key.\n"
docker run -i --rm --name easy-rsa  \
 -v "$( cd "$( dirname "$0" )" && pwd )"/keys:/easy-rsa \
 -v "$( cd "$( dirname "$0" )" && pwd )"/build-ca:/er/build-ca  \
 -v "$( cd "$( dirname "$0" )" && pwd )"/build-key:/er/build-key    \
 -v "$( cd "$( dirname "$0" )" && pwd )"/build-key-server:/er/build-key-server  \
 --env-file "$( cd "$( dirname "$0" )" && pwd )"/vars \
 new-easy-rsa /er/build-ca
docker run -i --rm --name easy-rsa  \
 -v "$( cd "$( dirname "$0" )" && pwd )"/keys:/easy-rsa  \
 -v "$( cd "$( dirname "$0" )" && pwd )"/build-ca:/er/build-ca  \
 -v "$( cd "$( dirname "$0" )" && pwd )"/build-key:/er/build-key    \
 -v "$( cd "$( dirname "$0" )" && pwd )"/build-key-server:/er/build-key-server  \
 --env-file "$( cd "$( dirname "$0" )" && pwd )"/vars   \
 new-easy-rsa /er/build-dh
