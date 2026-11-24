#!/bin/bash
OUT="Task06/outputs/server_admin_report.txt"
mkdir -p Task06/outputs

{
    echo "===== LINUX SERVER ADMINISTRATION REPORT ====="
    date
    echo
    echo "===== HOST AND OS ====="
    hostnamectl 2>&1 | head -n 15
    echo
    echo "===== USER AND GROUP ====="
    id
    getent group sudo
    echo
    echo "===== SYSTEMD SERVICE STATUS ====="
    systemctl is-system-running 2>&1
    systemctl --failed --no-pager 2>&1
    echo
    echo "===== CRON SERVICE ====="
    systemctl status cron --no-pager 2>&1 | head -n 12
    echo
    echo "===== PROCESS MONITORING ====="
    ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 12
    echo
    echo "===== MEMORY MONITORING ====="
    free -h
    echo
    echo "===== STORAGE MONITORING ====="
    df -h /
    echo
    echo "===== NETWORK MONITORING ====="
    ss -s
    echo
    echo "===== SYSTEM LOG SAMPLE ====="
    journalctl -n 12 --no-pager 2>&1
    echo
    echo "===== CRONTAB ====="
    crontab -l 2>&1 || true
    echo
    echo "===== ADMINISTRATION REPORT COMPLETE ====="
} > "$OUT"

cat "$OUT"
echo
echo "Saved to $OUT"
