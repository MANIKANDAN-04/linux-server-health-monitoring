#!/bin/bash

echo "============================="
echo "🔧 Systemd Service Status"
echo "============================="

# Header
printf "\n%-50s %-8s %-10s %-10s %-10s\n" "SERVICE NAME" "LOAD" "ACTIVE" "SUB" "ENABLED"
echo "------------------------------------------------------------------------------------------------------------"

# Get list of services with status
while read -r line; do
    service=$(echo "$line" | awk '{print $1}')
    load=$(echo "$line" | awk '{print $2}')
    active=$(echo "$line" | awk '{print $3}')
    sub=$(echo "$line" | awk '{print $4}')
    enabled=$(systemctl is-enabled "$service" 2>/dev/null)
    printf "%-50s %-8s %-10s %-10s %-10s\n" "$service" "$load" "$active" "$sub" "$enabled"
done < <(systemctl list-units --type=service --all --no-pager --no-legend)

echo -e "\n✅ Service status check complete."
