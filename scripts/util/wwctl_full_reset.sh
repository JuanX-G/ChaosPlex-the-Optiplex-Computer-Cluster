#!/bin/bash

# Title: Script to fully reset warewulfd with all of its subsystems
# Desc: Rebuilds overlays, assures NFS exports, restarts the system DHCP daemon and then restarts warewulfd
# Args: [none]
# Vars: [none]
#
set -euo pipefail

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root; must be run as root"
    exit
fi

wwctl configure --all
wwctl overlay build 

exportfs -ra
systemctl restart nfs-server

systemctl restart dhcpd
systemctl restart warewulfd

echo "warewulf restarted"
