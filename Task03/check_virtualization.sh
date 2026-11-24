#!/bin/bash
OUT="Task03/outputs/virtualization_check.txt"
mkdir -p Task03/outputs

{
    echo "===== VIRTUALIZATION ENVIRONMENT CHECK ====="
    date
    echo
    echo "===== SYSTEM VIRTUALIZATION DETECTION ====="
    systemd-detect-virt 2>&1 || true
    echo
    echo "===== CPU VIRTUALIZATION FLAGS ====="
    grep -m 1 -E '^(flags|Features)' /proc/cpuinfo | grep -oE 'vmx|svm' | sort -u || echo "No vmx/svm flag exposed"
    echo
    echo "===== CPU VIRTUALIZATION SUMMARY ====="
    lscpu | grep -iE 'Virtualization|Hypervisor'
    echo
    echo "===== KVM DEVICE ====="
    if [ -e /dev/kvm ]; then
        ls -l /dev/kvm
    else
        echo "/dev/kvm not available"
    fi
    echo
    echo "===== HYPERVISOR COMMANDS ====="
    for tool in qemu-system-x86_64 virsh VBoxManage; do
        command -v "$tool" || echo "$tool not installed"
    done
    echo
    echo "===== VIRTUALIZATION CHECK COMPLETE ====="
} > "$OUT"

cat "$OUT"
echo
echo "Saved to $OUT"
