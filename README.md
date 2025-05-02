# Linux Server Health Monitoring

This repository provides a suite of Bash scripts designed to monitor the health and performance of Linux servers. The scripts cover key system components such as CPU, memory, disk, network, services, firewall, and more — making it easier for sysadmins and DevOps engineers to maintain reliable infrastructure.

---

## 📁 Folder Structure
```
linux-server-health-monitoring/
├── check_cron_jobs/
│ └── check_cron_jobs.sh
├── cpu_usage_report/
│ └── cpu_usage_report.sh
├── disk_usage_report/
│ └── disk_usage_report.sh
├── firewall_status_check/
│ └── firewall_status_check.sh
├── memory_usage_report/
│ └── memory_usage_report.sh
├── network_monitoring_report/
│ └── network_monitoring_report.sh
├── package_patch_status/
│ └── package_patch_status.sh
├── systemd_services_check/
│ └── systemd_services_check.sh
└── zombie_process_check/
└── zombie_process_check.sh
```


---
## ⚙️ Script Overview

| Script Name                    | Description                                                  |
|-------------------------------|--------------------------------------------------------------|
| `check_cron_jobs.sh`          | Lists and verifies scheduled cron jobs for all users.        |
| `cpu_usage_report.sh`         | Reports current CPU usage, load averages, and top processes. |
| `disk_usage_report.sh`        | Shows disk space usage across mounted filesystems.           |
| `firewall_status_check.sh`    | Checks the status and rules of the active firewall.          |
| `memory_usage_report.sh`      | Provides RAM and swap usage statistics.                      |
| `network_monitoring_report.sh`| Monitors network usage, interface stats, and connections.    |
| `package_patch_status.sh`     | Lists outdated packages and pending patches.                 |
| `systemd_services_check.sh`   | Checks status of critical systemd services.                  |
| `zombie_process_check.sh`     | Detects zombie and unresponsive processes.                   |

---

## 🔧 Requirements

- Bash (v4 or later)
- Standard Linux utilities: `top`, `ps`, `df`, `free`, `netstat`/`ss`, `systemctl`, etc.
- Run as root or with appropriate permissions for full visibility.

---

## 📌 Notes

- These scripts are written for portability and should work across most modern Linux distributions.
- Log files and detailed outputs (if any) are noted inside each script.

---

## 🛠️ Contributions

Contributions, improvements, and suggestions are welcome! Please open an issue or a pull request.