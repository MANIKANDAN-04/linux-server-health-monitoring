#!/bin/bash

echo "==============================="
echo "🧟 Zombie & Hung Process Report"
echo "==============================="

# Timestamp
echo -e "\n📅 Timestamp: $(date)"

# Zombie Processes (State Z)
echo -e "\n🧟 Zombie Processes (state 'Z'):"
zombies=$(ps -eo pid,ppid,state,cmd | awk '$3 == "Z"')
zombie_count=$(echo "$zombies" | grep -c "^" || echo 0)

if [ "$zombie_count" -gt 0 ]; then
    echo -e "Found $zombie_count zombie process(es):"
    echo -e "PID\tPPID\tSTATE\tCOMMAND"
    echo "$zombies"
else
    echo "✅ No zombie processes found."
fi

# Hung Processes (State D)
echo -e "\n⏸️ Hung Processes (state 'D' - uninterruptible sleep):"
hung=$(ps -eo pid,ppid,state,etime,cmd | awk '$3 == "D"')
hung_count=$(echo "$hung" | grep -c "^" || echo 0)

if [ "$hung_count" -gt 0 ]; then
    echo -e "Found $hung_count hung process(es):"
    echo -e "PID\tPPID\tSTATE\tELAPSED\tCOMMAND"
    echo "$hung"
else
    echo "✅ No hung processes found."
fi

echo -e "\n✅ Process state report complete."
