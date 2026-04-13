#!/bin/bash
set -euo pipefail
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root; must be run as root"
    exit
fi

upper_node_count=$1
verbosity_level=$2

./get_jobs_status.sh

./get_node_status.sh "$upper_node_count" "$verbosity_level"
