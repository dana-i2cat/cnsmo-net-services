FROM ubuntu:14.04

RUN \
  sed -i 's/^# \(.*-backports\s\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y haproxy python && \
  sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy && \
  rm -rf /var/lib/apt/lists/*

ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ADD start.bash /haproxy-start

WORKDIR /etc/haproxy

ENV COUCHDB_SERVERS="localhost:8080"

ENV COUCHDB_USERNAME=""
ENV COUCHDB_PASSWORD=""

ENV COUCHDB_HOSTNAME="134.158.75.86:8080"

CMD ["bash", "/haproxy-start"]

EXPOSE 8080
