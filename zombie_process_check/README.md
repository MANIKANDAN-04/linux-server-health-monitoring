# 🧟 Zombie & Hung Process Report

Zombie and hung processes can indicate underlying issues with system performance or reliability. Zombie processes occur when a process has completed execution but remains in the process table due to its parent process not collecting its exit status. Hung processes occur when a process is stuck in an uninterruptible sleep state (state 'D'), often waiting for I/O operations to complete.

This script helps to identify and report both zombie and hung processes, enabling system administrators to resolve potential issues.

---

## 📌 What Is This Script?

`zombie_process_check.sh` is a monitoring script designed to detect and report any zombie or hung processes on your Linux system. 

It provides a detailed overview of:
- Zombie processes (state 'Z')
- Hung processes (state 'D')

---

## 🎯 Why Monitor Zombie and Hung Processes?

- **System Health**: Zombie and hung processes may consume resources and lead to system instability.
- **Performance Issues**: Hung processes can block system resources, leading to poor performance.
- **Troubleshooting**: Identifying and eliminating zombie and hung processes helps maintain smooth operation.

---

## 🔍 What This Script Monitors

| Metric                | Description                                                             |
|-----------------------|-------------------------------------------------------------------------|
| **Zombie Processes**   | Processes that have completed execution but still occupy system resources. |
| **Hung Processes**     | Processes that are stuck in an uninterruptible sleep state, usually due to I/O operations. |
| **PID**                | Process ID of the zombie or hung process.                               |
| **PPID**               | Parent Process ID of the process.                                       |
| **State**              | The current state of the process (Z for zombie, D for hung).            |
| **Command**            | The command that initiated the process.                                 |
| **Elapsed Time**       | Elapsed time for hung processes stuck in uninterruptible sleep.         |

---

## 🧠 How It Works

- **Zombie Processes**: The script identifies any processes in the 'Z' state (zombie processes) and reports their PID, PPID, state, and the command that initiated the process.
- **Hung Processes**: The script also detects processes in the 'D' state (hung processes) and reports their PID, PPID, elapsed time, and the command.
- **Timestamps**: The report includes the current timestamp to track when the checks were performed.

---

## 📈 Why It’s Useful

- **Resource Management**: Identifying zombie processes helps free up system resources that may otherwise be wasted.
- **System Debugging**: Helps troubleshoot issues with hung processes, which are often caused by system bottlenecks or hardware failures.
- **Improved Stability**: Regular checks for zombie and hung processes help maintain system stability.

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x zombie_process_check.sh
```

### 2. Run the script:

```bash
./zombie_process_check.sh
```

> ⚠️ This script requires root access to view all process details, so you may need to run it with `sudo`:

```bash
sudo ./zombie_process_check.sh
```

---

## 📄 Notes

- **Zombie processes** do not consume system resources actively, but they still occupy the process table.
- **Hung processes** can block system resources and lead to performance degradation, requiring intervention.
- The script outputs a timestamp and detailed process information to help administrators quickly identify problematic processes.
- **No zombie or hung processes**: The script will report a message confirming no issues were found.

