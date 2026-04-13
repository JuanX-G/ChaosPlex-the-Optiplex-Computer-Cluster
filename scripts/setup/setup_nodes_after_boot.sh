#!/bin/bash
#
# Title: Script to fully setup nodes after booting
# Desc: Sets up munge using 'setup_munge_on_nodes.sh' and then restarts slurmd on the nodes
# Args: [first-arg]: Number of the highest node in the cluster
# Vars: Uses the NODE_NAME_ROOT variable to determine to root from which the nodes names are derived; default value is "node0"

set -euo pipefail
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root; must be run as root"
    exit
fi

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
