# 📊 CPU Usage Report

Monitoring **CPU usage** is critical for understanding system performance, identifying bottlenecks, and ensuring that workloads are evenly distributed across available cores. This script collects and displays detailed CPU metrics to help system administrators evaluate processor utilization in real time.

This script provides a comprehensive snapshot of your CPU’s load, usage patterns, and hardware details using various system utilities.

---

## 📌 What Is This Script?

`cpu_usage_report.sh` is a monitoring utility that gathers and summarizes CPU statistics from multiple sources including `top`, `mpstat`, `/proc/stat`, and `lscpu`. It helps you understand:

- Current load and utilization
- Per-core usage breakdown
- Jiffies converted to seconds
- Hardware configuration of the CPU

---

## 🎯 Why Monitor CPU Usage?

Monitoring CPU usage helps to:

- Identify high CPU-consuming processes or services.
- Detect uneven load distribution across cores.
- Investigate performance issues or system lags.
- Plan capacity for scaling and optimization.

---

## 🔍 What This Script Monitors

| Metric                     | Description                                                  |
|---------------------------|--------------------------------------------------------------|
| Uptime & Load Average     | Shows system uptime and current load metrics.                |
| CPU Usage Summary (top)   | Displays total CPU usage across different categories.         |
| CPU Stats (mpstat)        | Shows detailed per-core usage if `mpstat` is available.       |
| /proc/stat Breakdown      | Converts raw jiffy data into seconds for better readability. |
| CPU Model & Hardware Info | Displays model, sockets, cores, threads from `lscpu`.        |
| Per-Core Usage (top)      | Reports usage of each logical CPU core.                      |
| Number of Cores           | Lists the total number of CPU cores detected.                |

---

## 🧠 How It Works

- Uses standard Linux tools (`uptime`, `top`, `mpstat`, `lscpu`, etc.).
- Falls back gracefully if some tools (like `mpstat`) are missing.
- Converts CPU usage from jiffies to seconds for clarity.
- Extracts detailed CPU hardware info to give a full system overview.

---

## 📈 Why It’s Useful

- Great for **performance tuning** and **bottleneck analysis**.
- Assists in **capacity planning** and infrastructure upgrades.
- Supports quick diagnosis of system slowdowns.
- Helpful in both live troubleshooting and scheduled health checks.

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x cpu_usage_report.sh
```

### 2. Run the script:

```bash
./cpu_usage_report.sh
```

> For detailed stats, ensure tools like `sysstat` (which includes `mpstat`) are installed on your system:
>
> - Debian/Ubuntu: `sudo apt install sysstat`  
> - RHEL/CentOS: `sudo yum install sysstat`

---

## 📄 Notes

- If `mpstat` is not available, the script will notify and provide install guidance.
- The script presents converted CPU jiffies in **seconds** for easier interpretation.
- Designed to run with minimal dependencies and broad compatibility.
