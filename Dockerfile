FROM alpine

RUN apk add -U iproute2

COPY ./iptables_rules.sh /home

WORKDIR /home
CMD iptables -F \
    && sudo su iptables_rules.sh \ 
    && tc qdisc add dev eth0 root tbf rate $RATE burst $BURST latency $LATENCY \
    && watch -n $INTERVAL tc -s qdisc ls dev eth0
