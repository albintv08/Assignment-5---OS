#!/bin/bash
OUT="Task02/outputs/admin_audit.txt"
mkdir -p Task02/outputs

{
    echo "===== LINUX ADMINISTRATION AUDIT ====="
    date
    echo
    echo "===== CURRENT USER ====="
    id
    echo
    echo "===== SUDO AVAILABILITY ====="
    command -v sudo || true
    echo
    echo "===== SYSTEMD STATUS ====="
    systemctl is-system-running 2>&1
    echo
    echo "===== FAILED SERVICES ====="
    systemctl --failed --no-pager 2>&1
    echo
    echo "===== ACTIVE SERVICES (SAMPLE) ====="
    systemctl list-units --type=service --state=running --no-pager | head -n 15
    echo
    echo "===== DISK USAGE ====="
    df -h /
    echo
    echo "===== MEMORY ====="
    free -h
    echo
    echo "===== NETWORK LISTENING SOCKETS ====="
    ss -tuln
    echo
    echo "===== SSH SERVICE CHECK ====="
    systemctl is-active ssh 2>&1 || true
    echo
    echo "===== FIREWALL COMMAND CHECK ====="
    command -v ufw || echo "UFW is not installed"
    echo
    echo "===== AUDIT COMPLETE ====="
} > "$OUT"

cat "$OUT"
echo
echo "Saved to $OUT"
