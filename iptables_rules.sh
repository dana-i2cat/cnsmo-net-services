#!/bin/bash
#Set default policies
#iptables -P INPUT DROP
#Allow RELATED&ESTABLISHED CONNECTION: note that this is not 100% secure
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
#Allow loopback traffic
iptables -A INPUT -s 127.0.0.0/8 -j ACCEPT
#Enable UPC&Ctf traffic
iptables -A INPUT -s 84.88.32.0/21 -j ACCEPT
iptables -A INPUT -s 84.88.40.0/23 -j ACCEPT
iptables -A INPUT -s 147.83.0.0/16 -j ACCEPT
iptables -A INPUT -s 172.16.0.0/24 -j ACCEPT
iptables -A INPUT -s 172.16.1.0/24 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 8000 -j DROP
