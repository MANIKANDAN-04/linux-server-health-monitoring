# 💽 Disk Usage Report

Disk usage monitoring is vital for maintaining system performance, avoiding outages, and ensuring adequate storage for applications and logs. Sudden disk space issues can cause service disruptions, failed updates, or even data loss.

This script provides a quick and organized summary of your system's disk and inode usage to help system administrators proactively manage storage.

---

## 📌 What Is This Script?

`disk_usage_report.sh` is a shell script that generates a report on:

- Disk space usage (with human-readable sizes)
- Inode usage (a common cause of "disk full" issues even when space is available)

It leverages standard tools to give a full picture of disk health in a readable format.

---

## 🎯 Why Monitor Disk Usage?

Regular disk monitoring helps to:

- Prevent services from crashing due to full disks.
- Detect abnormal disk growth patterns or log file bloat.
- Ensure critical partitions like `/`, `/var`, and `/home` are within safe usage limits.
- Identify inode exhaustion — which can silently halt file creation.

---

## 🔍 What This Script Monitors

| Metric               | Description                                                  |
|----------------------|--------------------------------------------------------------|
| Disk Space Usage     | Shows mount points, space used, available, and usage %.      |
| Inode Usage          | Displays inode stats per mounted filesystem.                 |

---

## 🧠 How It Works

- Uses `df -h` to report disk usage with sizes in GB/MB for readability.
- Uses `df -iT` and filters device-mounted filesystems to show inode stats.
- Output is organized with section headers for clarity.

---

## 📈 Why It’s Useful

- Avoids downtime due to storage overuse.
- Quickly shows which partitions are approaching full capacity.
- Catches inode issues — which are often missed in regular monitoring.
- Ideal for scripting, automation, or integrating into daily health checks.

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x disk_usage_report.sh
```

### 2. Run the script:

```bash
./disk_usage_report.sh
```

> No additional dependencies are required. Works out of the box on most Linux distributions.

---

## 📄 Notes

- Only device-mounted filesystems are included in the inode report.
- Designed to provide quick visibility without needing external tools.

## Sample Image

