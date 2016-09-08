FROM alpine:3.4

RUN apk add -U \
    haproxy \
    python \
    bash \
  && rm -rf /var/cache/apk/*

ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ADD start.bash /haproxy-start

WORKDIR /etc/haproxy

ENV COUCHDB_SERVERS="localhost:8080"

ENV COUCHDB_USERNAME=""
ENV COUCHDB_PASSWORD=""

ENV COUCHDB_HOSTNAME="134.158.75.86:8080"

CMD ["bash", "/haproxy-start"]

EXPOSE 8080
