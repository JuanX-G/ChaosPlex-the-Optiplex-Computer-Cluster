#!/bin/bash

# Title: Script to query the slurm job queue
# Desc: Queries the job queue
# Args: [none]
# Vars: [none]

set -euo pipefail
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root; must be run as root"
    exit
fi

echo "jobs queue"
squeue
