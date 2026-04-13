#!/bin/bash
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
