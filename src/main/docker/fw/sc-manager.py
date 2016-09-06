#!/usr/bin/python2.7
import getopt
import subprocess
import sys
import os


def usage():
    print "Usage:"
    print "You can use the following keywords:"
    print "---------------------------------------------------------------------------------------------------------------"
    print "| Add new rule: \t\tadd\tDelete existing rule:\tdel \t| Input:\tin\tOutput: out  |"
    print "| Filter by Destination IP: \tdst\tFilter by Source IP:\tsrc\t| Accept:\tacpt\tDrop:\tdrop |"
    print "---------------------------------------------------------------------------------------------------------------"
    print "Rule must be written in this order:"
    print "add/del in/out <protocol> <port> src/dst <ip> acpt/drop"
    print "A deny-all input policy may be set using the following format:"
    print "-p denyall"
    exit()


def add_rule():
    action = '-A' if sys.argv[1] == 'add' else '-D' if sys.argv[1] == 'del' else usage()
    io = 'INPUT' if sys.argv[2] == 'in' else 'OUTPUT' if sys.argv[2] == 'out' else usage()
    accept = 'ACCEPT' if sys.argv[7] == 'acpt' else 'DROP' if sys.argv[7] == 'drop' else usage()
    direction = '-s' if sys.argv[5] == 'src' else '-d' if sys.argv[5] == 'dst' else usage()
    opts = {'iptables': '/sbin/iptables', 'action': action, 'io': io, 'protocol': sys.argv[3], 'port': sys.argv[4], 'direction': direction,'ipAddress': sys.argv[6], 'accept': accept}
    ipcmd = '{iptables} {action} {io} -p {protocol} --dport {port} {direction} {ipAddress} -j {accept}'.format(**opts)
    print ipcmd
    iptables = subprocess.call(ipcmd, shell=True)


def config_denyall_input():

    get_interfaces = "ls /sys/class/net"
    interfaces = subprocess.check_output(get_interfaces, shell=True).rstrip('\n')

    allow_all_vpn = None
    if "tap0" in interfaces:
        allow_all_vpn = "iptables -A INPUT -i tap0 -s 10.10.10.0/24 -j ACCEPT"

    allow_lo = "iptables -A INPUT -i lo -j ACCEPT"
    allow_related = "iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT"
    allow_icmp_request = "iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT"
    allow_icmp_reply = "iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT"
    input_policy_drop = "iptables -P INPUT DROP"

    rules = [allow_lo, allow_related, input_policy_drop, allow_icmp_request, allow_icmp_reply]
    if allow_all_vpn:
        rules.append(allow_all_vpn)

    for rule in rules:
        print rule
        subprocess.call(rule, shell=True)


def main():
    if not os.getuid() == 0:
        print "You must be root to change IPTables."
        exit()

    policy = None
    opts, _ = getopt.getopt(sys.argv[1:], "p:", [])
    for opt, arg in opts:
        if opt == "-p":
            policy = arg

    if policy:
        if policy != "denyall":
            usage()
        else:
            config_denyall_input()
    else:
        if len(sys.argv) != 8:
            usage()
        else:
            add_rule()

if __name__ == "__main__":
    main()
