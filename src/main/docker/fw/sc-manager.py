#!/usr/bin/python2.7
import subprocess
import sys
import os

def usage():
    print "Usage:"
    print "You can use the following keywoards:"
    print "---------------------------------------------------------------------------------------------------------------"
    print "| Add new rule: \t\tadd\tDelete existing rule:\tdel \t| Input:\tin\tOutput: out  |"
    print "| Filter by Destination IP: \tdest\tFilter by Source IP:\tsource\t| Accept:\tacpt\tDrop:\tdrop |"
    print "---------------------------------------------------------------------------------------------------------------"
    print "Rule must be written in this order:"
    print "add/del in/out <protocol> <port> dest/source <ip> acpt/drop"
    exit()

def add_rule():
    action = '-A' if sys.argv[1] == 'add' else '-D' if sys.argv[1] == 'del' else usage()
    io = 'INPUT' if sys.argv[2] == 'in' else 'OUTPUT' if sys.argv[2] == 'out' else usage()
    accept = 'ACCEPT' if sys.argv[7] == 'acpt' else 'DROP' if sys.argv[7] == 'drop' else usage()
    direction = '-s' if sys.argv[5] == 'source' else '-d' if sys.argv[5] == 'dest' else usage()
    opts = {'iptables': '/sbin/iptables', 'action': action, 'io': io, 'protocol': sys.argv[3], 'port': sys.argv[4], 'direction': direction,'ipAddress': sys.argv[6], 'accept': accept}
    ipcmd = '{iptables} {action} {io} -p {protocol} --dport {port} {direction} {ipAddress} -j {accept}'.format(**opts)
    print ipcmd
    iptables = subprocess.call(ipcmd, shell=True)

def main():
    if len(sys.argv) != 8:
        usage()
    if not os.getuid() == 0:
        print "You must be root to change IPTables."
        exit()
    add_rule() 

if __name__ == "__main__":
    main()
