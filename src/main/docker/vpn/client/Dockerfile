FROM alpine

RUN apk add -U \
    openvpn \
  && rm -rf /var/cache/apk/*

COPY ./client.conf /etc/openvpn
COPY ./client.crt /etc/openvpn
COPY ./ca.crt /etc/openvpn
COPY ./client.key /etc/openvpn
COPY ./tun_manager.sh /etc/openvpn

WORKDIR /etc/openvpn
CMD sh tun_manager.sh

CMD openvpn client.conf
