FROM alpine

RUN apk add -U \
    openvpn \
  && rm -rf /var/cache/apk/*

COPY ./server.conf /etc/openvpn
COPY ./server.crt /etc/openvpn
COPY ./ca.crt /etc/openvpn
COPY ./server.key /etc/openvpn
COPY ./dh2048.pem /etc/openvpn
COPY ./tun_manager.sh /etc/openvpn

WORKDIR /etc/openvpn

EXPOSE 1194/udp
CMD openvpn server.conf
