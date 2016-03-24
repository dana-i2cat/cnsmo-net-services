srvname="server"
echo -e "\nCreating $srvname"
docker run -i --rm --name easy-rsa -v "$( cd "$( dirname "$0" )" && pwd )"/keys:/easy-rsa --env-file "$( cd "$( dirname "$0" )" && pwd )"/vars new-easy-rsa /er/build-key-server $srvname


