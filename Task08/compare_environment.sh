#!/bin/bash

OUT="Task08/outputs/environment_comparison.txt"
mkdir -p Task08/outputs

{
    echo "===== DEPLOYMENT ENVIRONMENT EVIDENCE ====="
    date
    echo

    echo "===== OPERATING SYSTEM ====="
    cat /etc/os-release | grep -E '^(PRETTY_NAME|VERSION)='
    echo

    echo "===== KERNEL ====="
    uname -a
    echo

    echo "===== VIRTUALIZATION DETECTION ====="
    systemd-detect-virt 2>&1 || true
    echo

    echo "===== CPU ====="
    lscpu | grep -E '^(Architecture|CPU\\(s\\)|Model name|Hypervisor vendor):'
    echo

    echo "===== MEMORY ====="
    free -h
    echo

    echo "===== STORAGE ====="
    df -h /
    echo

    echo "===== CONTAINER RUNTIME ====="
    if command -v docker >/dev/null 2>&1; then
        docker --version
    else
        echo "Docker: not installed"
    fi

    if command -v podman >/dev/null 2>&1; then
        podman --version
    else
        echo "Podman: not installed"
    fi
    echo

    echo "===== VM MANAGEMENT TOOLS ====="
    for tool in virsh VBoxManage qemu-system-x86_64; do
        if command -v "$tool" >/dev/null 2>&1; then
            "$tool" --version 2>&1 | head -n 1
        else
            echo "$tool: not installed"
        fi
    done

    echo
    echo "===== EVIDENCE COLLECTION COMPLETE ====="
} > "$OUT"

cat "$OUT"
echo
echo "Saved to $OUT"
