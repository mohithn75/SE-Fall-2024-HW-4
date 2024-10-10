#!/bin/bash

# Retrieve the process IDs of infinite.sh
PROCESS_IDS=$(pgrep -f infinite.sh)

# Verify if there are any matching process IDs
if [ -z "$PROCESS_IDS" ]; then
    echo "No instances of infinite.sh are currently active."
else
    # Iterate through each process ID and terminate it
    for PROCESS_ID in $PROCESS_IDS; do
        kill "$PROCESS_ID"
        echo "Terminated infinite.sh with PID: $PROCESS_ID"
    done
fi
