#!/usr/bin/python2.7
import subprocess
import sys
import os

def usage():
    print "Usage"
    print "add/del in/out protocol port ip acpt/drop"
    exit()

def add_rule():
    action = '-A' if sys.argv[1] == 'add' else '-D' if sys.argv[1] == 'del' else usage()
    io = 'INPUT' if sys.argv[2] == 'in' else 'OUTPUT' if sys.argv[2] == 'out' else usage()
    accept = 'ACCEPT' if sys.argv[6] == 'acpt' else 'DROP' if sys.argv[6] == 'drop' else usage()
    opts = {'iptables': '/sbin/iptables', 'action': action, 'io': io, 'protocol': sys.argv[3], 'port': sys.argv[4], 'ipAddress': sys.argv[5], 'accept': accept}
    ipcmd = '{iptables} {action} {io} -p {protocol} --dport {port} -d {ipAddress} -j {accept}'.format(**opts)
    print ipcmd
    iptables = subprocess.call(ipcmd, shell=True)

def main():
    if len(sys.argv) != 7:
        usage()
    if not os.getuid() == 0:
        print "You must be root to change IPTables."
        exit()
    add_rule() 

if __name__ == "__main__":
    main()
