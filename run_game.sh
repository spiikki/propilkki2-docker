#!/bin/bash
service pp2host start
while true; do
    tail -f /etc/pp2host/static/playlog.txt
done