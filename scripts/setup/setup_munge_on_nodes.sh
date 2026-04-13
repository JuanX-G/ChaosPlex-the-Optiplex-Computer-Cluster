#! /bin/bash
set -euo pipefail
# Title: Script to setup munge on the nodes
# Desc: Sets up munge so slurm can communicate the jobs to the setup_nodes_after_boot.sh
# Args: [first-arg]: Number of the highest node in the cluster
# Vars: Uses the NODE_NAME_ROOT variable to determine to root from which the nodes names are derived; default value is "node0"

echo "[#] seting up munge on nodes that are currently online"

upper_node_count=$1

if [ -z "${NODE_NAME_ROOT:-}" ]; then
	NODE_NAME_ROOT="node0"
fi


count=1;
while [[ $count -le $upper_node_count ]]; do
    tmp_node_name="${NODE_NAME_ROOT}${count}"
	wwctl ssh "$tmp_node_name" "
	chown munge:munge /etc/munge/munge.key
	chmod 400 /etc/munge/munge.key
	chown -R munge:munge /etc/munge
	chmod 700 /etc/munge
	"
	echo "[#] munge key installed on $tmp_node_name"
	wwctl ssh "$tmp_node_name" systemctl restart munge
	echo "[#] munge restarted on $tmp_node_name"
	((count++))
done

