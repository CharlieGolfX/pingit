#!/bin/bash

LOGFILE="pingit.log"

while true; do
    echo "----- $(date +"%H:%M:%S %d.%m.%Y") -----" >> "$LOGFILE"
    ping -c 1 1.1.1.1 >> "$LOGFILE" 2>&1
    sleep 5
done