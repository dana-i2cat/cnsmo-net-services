#!/bin/bash

sh gen_index.sh

echo -e "Generating CA certificate and key. Note: Default variables can be edit in vars.example\n"

docker run -it --rm --name easy-rsa -v $(pwd)/keys:/easy-rsa --env-file vars new-easy-rsa /er/build-ca

echo -e "\nGenerating server certificate and keys.\n"

#docker run -it --rm --name easy-rsa -v $(pwd)/keys:/easy-rsa --env-file vars carbonsphere/dock-easy-rsa /er/build-key-server $srvname

docker run -it --rm --name easy-rsa -v $(pwd)/keys:/easy-rsa --env-file vars new-easy-rsa /er/build-dh

echo -e "Moving necessary files to openvpn directory\n"

#cp ./keys/ca.crt ./openvpn
#cp ./keys/$srvname.crt ./openvpn
#cp ./keys/$srvname.key ./openvpn
#p ./keys/dh2048.pem ./openvpn

#ls -l ./openvpn
