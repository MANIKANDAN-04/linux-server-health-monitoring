#!/bin/bash

echo "=========================="
echo "💽 Disk Monitoring Report"
echo "=========================="

# Basic Disk Usage
echo -e "\n📦 Disk Space Usage (df -h):"
df -h --output=source,fstype,size,used,avail,pcent,target

# Inodes Usage

echo -e "\n🧮 Inodes Usage (df -iT):"
df -iT | awk 'NR==1 || /\/dev\//'


echo -e "\n✅ Disk monitoring complete."
