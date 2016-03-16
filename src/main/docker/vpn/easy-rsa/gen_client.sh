if ! [ -e "keys/ca.crt" ]; then
  echo "Error: CA certificate and key not found. Please run gen_init.sh first"
  exit
fi

echo -e "\nGenerating client certificate and keys.\n"
srvname="client"
echo -e "\nCreating $srvname"

docker run -it --rm --name easy-rsa -v $(pwd)/keys:/easy-rsa --env-file vars new-easy-rsa /er/build-key $srvname


