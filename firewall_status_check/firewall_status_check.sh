#!/bin/bash

echo "============================="
echo "🛡️  Firewall Status Check"
echo "============================="

# Check for ufw
if command -v ufw &> /dev/null; then
    echo -e "\n🔧 UFW Firewall (Ubuntu/Debian):"
    sudo ufw status verbose

# Check for firewalld
elif systemctl list-units --type=service | grep -q firewalld; then
    echo -e "\n🔥 firewalld (RHEL/CentOS/Fedora):"
    sudo firewall-cmd --state
    echo -e "\n📋 Active Zones:"
    sudo firewall-cmd --get-active-zones
    echo -e "\n🚪 Open Ports:"
    sudo firewall-cmd --list-ports
    echo -e "\n🔐 Services Allowed:"
    sudo firewall-cmd --list-services

# Fallback to iptables
elif command -v iptables &> /dev/null; then
    echo -e "\n📦 iptables (Generic/Fallback):"
    sudo iptables -L -n -v
    echo -e "\n🔁 NAT Rules:"
    sudo iptables -t nat -L -n -v

else
    echo -e "\n❌ No supported firewall tool (ufw, firewalld, iptables) found!"
fi

echo -e "\n✅ Firewall status check complete."
