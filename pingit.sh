#!/bin/bash

LOGFILE="pingit.log"

while true; do
    echo "----- $(date +"%H:%M:%S %d.%m.%Y") -----" >> "$LOGFILE"
    PING_OUTPUT=$(ping -c 1 1.1.1.1 2>&1)
    if echo "$PING_OUTPUT" | grep -q "1 received"; then
        echo "$PING_OUTPUT" | awk '
            /PING/ { 
                print "--- 1.1.1.1 ping statistics ---"
                print "bytes sent: 56"
            }
            /bytes from/ {
                match($0, /icmp_seq=([0-9]+)/, icmp);
                match($0, /ttl=([0-9]+)/, ttl);
                match($0, /time=([0-9.]+)/, t);
                print "bytes received: 64"
                print "icmp: " icmp[1]
                print "ttl: " ttl[1]
                print "time: " t[1] " ms"
            }
        ' >> "$LOGFILE"
    else
        echo "--- 1.1.1.1 ping statistics ---" >> "$LOGFILE"
        echo "Ping failed or no response received." >> "$LOGFILE"
        echo "$PING_OUTPUT" | grep -E "unknown host|100% packet loss|unreachable|Name or service not known" >> "$LOGFILE"
    fi
    echo "" >> "$LOGFILE"
    sleep 5
done