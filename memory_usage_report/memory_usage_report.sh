#!/bin/bash

echo "=========================="
echo "Memory & Disk Usage Report"
echo "=========================="

# Human-readable memory usage (already shows GB)
echo -e "\n📊 Memory Summary (free -h):"
free -h

# Raw /proc/meminfo summary (converted to GB)
echo -e "\n📁 Memory Details from /proc/meminfo (in GB):"
fields="MemTotal MemFree MemAvailable Buffers Cached SwapTotal SwapFree SwapCached Active Inactive"
for field in $fields; do
    value_kb=$(grep "^$field:" /proc/meminfo | awk '{print $2}')
    value_gb=$(awk "BEGIN {printf \"%.2f\", $value_kb / 1024 / 1024}")
    echo "$field: ${value_gb} GB"
done

# Memory usage as percentages
echo -e "\n📐 Calculated Memory Usage:"
total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
available=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
used=$((total - available))
used_pct=$(awk "BEGIN {printf \"%.2f\", ($used / $total) * 100}")
echo "Total Memory:     $(awk "BEGIN {printf \"%.2f\", $total / 1024 / 1024}") GB"
echo "Used Memory:      $(awk "BEGIN {printf \"%.2f\", $used / 1024 / 1024}") GB"
echo "Available Memory: $(awk "BEGIN {printf \"%.2f\", $available / 1024 / 1024}") GB"
echo "Used Percentage:  $used_pct%"

# Swap usage
echo -e "\n📦 Swap Memory Usage:"
swap_total=$(grep SwapTotal /proc/meminfo | awk '{print $2}')
swap_free=$(grep SwapFree /proc/meminfo | awk '{print $2}')
swap_used=$((swap_total - swap_free))
swap_pct=0
if [ "$swap_total" -ne 0 ]; then
    swap_pct=$(awk "BEGIN {printf \"%.2f\", ($swap_used / $swap_total) * 100}")
fi
echo "Total Swap:       $(awk "BEGIN {printf \"%.2f\", $swap_total / 1024 / 1024}") GB"
echo "Used Swap:        $(awk "BEGIN {printf \"%.2f\", $swap_used / 1024 / 1024}") GB"
echo "Free Swap:        $(awk "BEGIN {printf \"%.2f\", $swap_free / 1024 / 1024}") GB"
echo "Swap Usage:       $swap_pct%"

echo -e "\n✅ Memory Usage report complete."
