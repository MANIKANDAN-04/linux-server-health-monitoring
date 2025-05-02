#!/bin/bash

echo "=========================="
echo "📊 CPU Usage Report"
echo "=========================="

# Uptime and load averages
echo -e "\n🔁 Uptime and Load Average:"
uptime

# CPU usage summary from top
echo -e "\n📋 Top CPU Summary:"
top -b -n1 | grep "Cpu(s)"

# CPU usage using mpstat (if available)
if command -v mpstat &> /dev/null; then
    echo -e "\n📈 CPU Stats (mpstat):"
    mpstat -P ALL 1 1
else
    echo -e "\n⚠️ mpstat not found. To install:"
    echo "  Ubuntu/Debian: sudo apt install sysstat"
    echo "  RedHat/CentOS: sudo yum install sysstat"
fi

# CPU details from /proc/stat
echo -e "\n📁 Raw CPU Data from /proc/stat (Jiffies and Seconds):"
CLK_TCK=$(getconf CLK_TCK)

# Header
printf "%-6s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s\n" \
       "CPU" "user(s)" "nice(s)" "system(s)" "idle(s)" "iowait(s)" "irq(s)" "softirq(s)" "steal(s)" "guest(s)" "g_nice(s)"

# Parse and convert
grep '^cpu' /proc/stat | while read -r cpu user nice system idle iowait irq softirq steal guest guest_nice; do
    printf "%-6s %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f %10.2f\n" \
        "$cpu" \
        "$(echo "$user / $CLK_TCK" | bc -l)" \
        "$(echo "$nice / $CLK_TCK" | bc -l)" \
        "$(echo "$system / $CLK_TCK" | bc -l)" \
        "$(echo "$idle / $CLK_TCK" | bc -l)" \
        "$(echo "$iowait / $CLK_TCK" | bc -l)" \
        "$(echo "$irq / $CLK_TCK" | bc -l)" \
        "$(echo "$softirq / $CLK_TCK" | bc -l)" \
        "$(echo "$steal / $CLK_TCK" | bc -l)" \
        "$(echo "$guest / $CLK_TCK" | bc -l)" \
        "$(echo "$guest_nice / $CLK_TCK" | bc -l)"
done

echo -e "\n🕒 Note: Values shown are in **seconds**, converted from jiffies (1 sec = $CLK_TCK jiffies)"



# CPU model info
echo -e "\n🧠 CPU Model Info:"
lscpu | grep -E 'Model name|Socket|Core|Thread'

# Per-core usage using top
echo -e "\n🎯 Per-CPU Usage (top):"
top -bn1 | grep "Cpu" | awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}'

# Optional: number of cores
echo -e "\n🔢 Number of CPU cores:"
nproc

echo -e "\n✅ CPU Usage report complete."
