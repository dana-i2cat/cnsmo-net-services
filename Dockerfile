FROM alpine

RUN apk add -U iproute2

COPY ./sc-manager.py /home

WORKDIR /home
