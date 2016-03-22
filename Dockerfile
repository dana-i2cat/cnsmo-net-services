FROM alpine

RUN apk add -U iproute2

COPY ./sc-manager.py /home/

ENTRYPOINT ["/home/sc-manager.py"]
