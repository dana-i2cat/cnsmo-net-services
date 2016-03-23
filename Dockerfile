FROM alpine

RUN apk add -U \
    iproute2 \
    python \
  && rm -rf /var/cache/apk/*

COPY ./sc-manager.py /usr/bin/

ENTRYPOINT ["/usr/bin/sc-manager.py"]
