#!/bin/bash
set -euo pipefail
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root; must be run as root"
    exit
fi

#
# Script for setting up for setting up nodes after the boot from iPXE.
# First argument denotes the highest node number
#

upper_node_count=$1
if [ -z "${NODE_NAME_ROOT:-}" ]; then
	NODE_NAME_ROOT="node0"
fi

echo "restarting 'slurmctld'"
systemctl restart slurmctld

./setup_munge_on_nodes.sh "$upper_node_count"

systemctl restart slurmctld; sleep 1 
scontrol reconfigure; sleep 1

count=1
while [[ $count -le $upper_node_count ]]; do
    tmp_node_name="${NODE_NAME_ROOT}${count}"
	scontrol reconfigure
	echo "restarting 'slurmd' on node $tmp_node_name"
	wwctl ssh $tmp_node_name systemctl restart slurmd
	((count++))
done
