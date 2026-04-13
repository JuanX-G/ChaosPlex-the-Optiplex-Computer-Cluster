#!/bin/bash

# Title: Script to fetch the status of all nodes and all the jobs in the queue
# Desc: Checks on the jobs using 'get_jobs_status.sh' and the nodes using 'get_node_status.sh'
# Args: [first-arg]: Number of the highest node in the cluster; [second-arg]: verbosity level for 'get_node_status.sh', either "v" for lower verbosity or "V" for more logs
# Vars: Uses the NODE_NAME_ROOT variable to determine to root from which the nodes names are derived; default value is "node0"

set -euo pipefail
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root; must be run as root"
    exit
fi

upper_node_count=$1
verbosity_level=$2

./get_jobs_status.sh

./get_node_status.sh "$upper_node_count" "$verbosity_level"
