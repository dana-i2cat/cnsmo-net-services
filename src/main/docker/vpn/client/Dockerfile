FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y openvpn

COPY ./client.conf /etc/openvpn/
COPY ./client.crt /etc/openvpn/
COPY ./ca.crt /etc/openvpn/
COPY ./client.key /etc/openvpn/
COPY ./tun_manager.sh /etc/openvpn/


WORKDIR /etc/openvpn 
CMD sudo sh tun_manager.sh

CMD sudo openvpn client.conf
