FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y openvpn

COPY ./server.conf /etc/openvpn
COPY ./server.crt /etc/openvpn
COPY ./ca.crt /etc/openvpn
COPY ./server.key /etc/openvpn
COPY ./dh2048.pem /etc/openvpn
COPY ./tun_manager.sh /etc/openvpn

WORKDIR /etc/openvpn 
CMD sudo sh tun_manager.sh

EXPOSE 1194/udp
CMD sudo openvpn server.conf
