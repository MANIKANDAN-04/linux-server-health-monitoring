#!/bin/bash

echo "========================================"
echo "🌐 Network Monitoring Report"
echo "========================================"

# Uptime and Host Info
echo -e "\n🖥️ Host and Uptime Info:"
hostnamectl 2>/dev/null || hostname
uptime -p

# IP addresses
echo -e "\n📡 IP Address Information:"
ip -br addr show

# Network interfaces stats
echo -e "\n📈 Interface Statistics:"
ip -s link show

# Bandwidth usage (requires ifstat or fallback to /proc/net/dev)
if command -v ifstat &>/dev/null; then
    echo -e "\n📊 Bandwidth Usage (ifstat - 1s sample):"
    ifstat 1 1
else
    echo -e "\n📊 Bandwidth Usage (/proc/net/dev snapshot):"
    printf "%-10s %12s %12s\n" "Interface" "RX (Bytes)" "TX (Bytes)"
    tail -n +3 /proc/net/dev | awk -F'[: ]+' '{printf "%-10s %12s %12s\n", $1, $2, $10}'
fi

# Active network connections
echo -e "\n🔗 Active Network Connections:"
ss -tunap | head -n 15

# Listening ports
echo -e "\n🎧 Listening Ports:"
ss -tuln

# Routing table
echo -e "\n🛣️ Routing Table:"
ip route

# DNS configuration
if [ -L /etc/resolv.conf ]; then
  echo "/etc/resolv.conf is a symlink to:"
  readlink -f /etc/resolv.conf
fi

echo -e "\n🌍 DNS Configuration (/etc/resolv.conf):"
cat /etc/resolv.conf


# Firewall status
echo -e "\n🔥 Firewall Status:"
if command -v ufw &>/dev/null; then
    ufw status verbose
elif command -v firewall-cmd &>/dev/null; then
    firewall-cmd --state
    firewall-cmd --list-all
elif command -v iptables &>/dev/null; then
    iptables -L -n -v
else
    echo "Firewall tool not found."
fi

# Network errors and dropped packets
echo -e "\n❌ Network Errors and Dropped Packets:"
netstat -i 2>/dev/null || ip -s link

echo -e "\n✅ Network monitoring report complete."
