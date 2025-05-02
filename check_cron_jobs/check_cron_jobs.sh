#!/bin/bash

echo "============================="
echo "📅 Cron and Systemd Job Monitor"
echo "============================="

# Function to list user crontabs
echo -e "\n🔍 User Crontabs:"
for user in $(cut -f1 -d: /etc/passwd); do
    crontab -l -u "$user" 2>/dev/null | grep -v '^#' | grep -v '^$' && echo "  [User: $user]" || continue
done

# Check system-wide crontab
echo -e "\n🗂️  System Crontab (/etc/crontab):"
grep -v '^#' /etc/crontab | grep -v '^$' || echo "  No entries."

# Check cron.d directory
echo -e "\n📁 /etc/cron.d entries:"
find /etc/cron.d -type f -exec bash -c 'echo -e "\n[$1]:"; grep -v "^#" "$1" | grep -v "^$"' _ {} \; 2>/dev/null

# Check cron.daily, weekly, monthly
for dir in daily weekly monthly hourly; do
    echo -e "\n📅 /etc/cron.$dir scripts:"
    ls -1 /etc/cron.$dir 2>/dev/null || echo "  Not found"
done

# Check systemd timers (if available)
if command -v systemctl &>/dev/null; then
    echo -e "\n⏲️  Systemd Timers (if any):"
    systemctl list-timers --all --no-pager --no-legend \
        | awk '{ printf "%-30s %-20s %-20s %-30s\n", $1, $2, $3, $NF }' \
        | sed '1iTIMER                         NEXT RUN            LAST RUN            UNIT'
else
    echo -e "\n⏲️  Systemd not available on this system."
fi

echo -e "\n✅ Cron and timer job scan complete."
