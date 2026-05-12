#!/bin/bash

# Title: Script to fetch the status of all nodes
# Desc: Checks on the nodes using 'get_node_status.sh'
# Args: [first-arg]: Number of the highest node in the cluster; [second-arg]: verbosity level for 'get_node_status.sh', either "v" for lower verbosity or "V" for more logs
# Vars: Uses the NODE_NAME_ROOT variable to determine to root from which the nodes names are derived; default value is "node0"

set -euo pipefail
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root; must be run as root"
    exit
fi

upper_node_count=$1
verbosity_level=$2

if [ -z "${NODE_NAME_ROOT:-}" ]; then
	NODE_NAME_ROOT="node0"
fi

echo "status of 'slurmctld'"
systemctl status slurmctld

echo "status of nodes nodes"
scontrol show nodes

count=1
while [[ $count -le $upper_node_count ]]; do
    tmp_node_name="${NODE_NAME_ROOT}${count}"
	if [[ $verbosity_level = 'V' ]]; then
		wwctl ssh $tmp_node_name "
		systemctl status slurmd
		systemctl status munge
		"
	elif [[ $verbosity_level = 'v' ]]; then
		wwctl ssh $tmp_node_name "
		systemctl status slurmd
		"
	fi
	((count++))
done
