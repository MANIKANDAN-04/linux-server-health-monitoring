# 🌐 Network Monitoring Report

Network monitoring helps ensure that the server's network connections are stable, secure, and efficient. It is crucial for diagnosing connectivity issues, ensuring proper bandwidth usage, and monitoring active connections and services.

This script provides a detailed network status report, including active connections, routing table, interface stats, firewall status, and more.

---

## 📌 What Is This Script?

`network_monitoring_report.sh` is a diagnostic script that collects key network metrics and status on your server. It provides insight into network performance, configurations, and active connections.

---

## 🎯 Why Monitor the Network?

- Detect network misconfigurations or issues.
- Track bandwidth usage and ensure network resources are not exhausted.
- Identify open ports and active services to mitigate security risks.
- Troubleshoot connectivity and firewall problems effectively.

---

## 🔍 What This Script Monitors

| Metric                   | Description                                                  |
|--------------------------|--------------------------------------------------------------|
| Host and Uptime Info      | Displays the host and system uptime.                         |
| IP Addresses              | Lists all active IP addresses for network interfaces.        |
| Interface Stats           | Shows stats for network interfaces (bytes received, transmitted). |
| Bandwidth Usage           | Tracks real-time network bandwidth using `ifstat` or fallback to `/proc/net/dev`. |
| Active Network Connections| Displays active TCP/UDP connections.                         |
| Listening Ports           | Lists all ports the system is listening on.                  |
| Routing Table             | Shows the system’s current routing configuration.            |
| DNS Configuration         | Displays the DNS configuration from `/etc/resolv.conf`.      |
| Firewall Status           | Checks the firewall tool (e.g., `ufw`, `firewalld`, `iptables`) for status and rules. |
| Network Errors & Dropped Packets| Displays errors and dropped packets on network interfaces. |

---

## 🧠 How It Works

- Gathers basic system information like uptime and hostname.
- Uses `ip`, `ss`, and other Linux utilities to gather information about the network.
- Detects available firewall tools (e.g., `ufw`, `firewalld`, `iptables`) and displays relevant firewall status.
- Provides real-time network stats, active connections, and bandwidth usage.

---

## 📈 Why It’s Useful

- Ensures your server’s network configuration is optimal and secure.
- Helps identify issues with bandwidth, active connections, or misconfigured routes.
- Aids in network troubleshooting by providing insights into active connections and dropped packets.
- Useful for monitoring systems with high traffic to optimize network performance.

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x network_monitoring_report.sh
```

### 2. Run the script:

```bash
./network_monitoring_report.sh
```

> ⚠️ To view complete output (especially firewall status), run with `sudo`:

```bash
sudo ./network_monitoring_report.sh
```

---

## 📄 Notes

- The script checks for multiple firewall tools, displaying their status if detected.
- Requires root privileges for accessing certain network and firewall information.
- Compatible with most Linux distributions.

## Sample Image


![network](https://github.com/user-attachments/assets/dd83e527-7d47-4282-a2fc-5ccf939406f1)
