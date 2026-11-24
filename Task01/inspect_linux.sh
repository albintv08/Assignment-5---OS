#!/bin/bash

OUT="Task01/outputs/system_inspection.txt"
mkdir -p Task01/outputs

{
    echo "===== LINUX SYSTEM COMPONENT INSPECTION ====="
    date
    echo
    echo "===== OPERATING SYSTEM ====="
    cat /etc/os-release | grep -E 'PRETTY_NAME|VERSION='
    echo
    echo "===== KERNEL ====="
    uname -a
    echo
    echo "===== CPU INFORMATION ====="
    lscpu | grep -E 'Architecture|CPU\(s\)|Model name|Thread|Core|Socket'
    echo
    echo "===== MEMORY MANAGEMENT ====="
    free -h
    echo
    echo "===== RUNNING PROCESSES ====="
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 10
    echo
    echo "===== FILE SYSTEMS ====="
    df -hT
    echo
    echo "===== NETWORK INTERFACES ====="
    ip -brief address
    echo
    echo "===== SHELL ====="
    echo "$SHELL"
    echo
    echo "===== SYSTEMD SERVICES ====="
    systemctl is-system-running 2>&1
    echo
    echo "===== INSPECTION COMPLETE ====="
} > "$OUT"

cat "$OUT"
echo
echo "Saved inspection output to $OUT"
