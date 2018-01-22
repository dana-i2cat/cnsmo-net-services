FROM alpine:3.4

RUN apk add -U \
    openvpn \
  && rm -rf /var/cache/apk/*

COPY ./client.conf /etc/openvpn/
COPY ./client.crt /etc/openvpn/
COPY ./ca.crt /etc/openvpn/
COPY ./client.key /etc/openvpn/
COPY ./tun_manager.sh /etc/openvpn/
COPY ./update-resolv-conf.sh /etc/openvpn/

WORKDIR /etc/openvpn

CMD openvpn client.conf
