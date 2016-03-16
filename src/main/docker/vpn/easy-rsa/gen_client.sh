
echo -e "\nGenerating client certificate and keys.\n"
srvname="client"
echo -e "\nCreating $srvname"

docker run -it --rm --name easy-rsa -v "$( cd "$( dirname "$0" )" && pwd )"/keys:/easy-rsa --env-file "$( cd "$( dirname "$0" )" && pwd )"/vars new-easy-rsa /er/build-key $srvname


