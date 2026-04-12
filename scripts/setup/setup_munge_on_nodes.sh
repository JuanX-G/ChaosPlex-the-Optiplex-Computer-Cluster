#! /bin/bash
#
# Script to setup munge on the nodes
# Nodes must have their munge key configured after they boot
# it must be done munually, because who knows
#

echo "[#] seting up munge on nodes that are currently online"

upper_node_count=$1

if [ $NODE_NAME_ROOT = "" ]; then
	NODE_NAME_ROOT="node0"
fi


count=1;
while [[ $count -le $upper_node_count ]]; do
	tmp_node_name="$NODE_NAME_ROOT""$count"
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

