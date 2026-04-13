#!/bin/bash
set -euo pipefail

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root; must be run as root"
    exit
fi

#
# Script to fully restart warewulf
#

wwctl configure --all
wwctl overlay build 

exportfs -ra
systemctl restart nfs-server

systemctl restart dhcpd
systemctl restart warewulfd

echo "warewulf restarted"
