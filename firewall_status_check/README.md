# 🛡️ Firewall Status Check

A firewall is a system’s first line of defense against unauthorized access. Monitoring your firewall ensures that your server’s ports, services, and zones are correctly configured, and helps to identify security misconfigurations that could lead to exposure.

This script checks the status of your firewall using whichever tool is available on your Linux system — `ufw`, `firewalld`, or `iptables`.

---

## 📌 What Is This Script?

`firewall_status_check.sh` is a diagnostic script that automatically detects and reports the status of the active firewall system on your Linux server.

It supports:

- `ufw` (Uncomplicated Firewall)
- `firewalld`
- `iptables` (fallback)

---

## 🎯 Why Monitor the Firewall?

Firewall monitoring helps:

- Detect misconfigured or inactive firewalls.
- Confirm whether critical ports are exposed or protected.
- Verify if essential services are allowed or blocked.
- Ensure consistency in security posture across systems.

---

## 🔍 What This Script Monitors

| Component          | Description                                               |
|--------------------|-----------------------------------------------------------|
| UFW Status         | Provides verbose firewall rules on Ubuntu/Debian systems. |
| firewalld State    | Shows active zones, open ports, and allowed services.     |
| iptables Rules     | Lists all active filter and NAT rules.                    |
| Detection Fallback | Automatically detects available tool among `ufw`, `firewalld`, or `iptables`. |

---

## 🧠 How It Works

- Checks for the availability of `ufw`, `firewalld`, and `iptables` in that order.
- Runs relevant commands for the detected firewall system.
- Presents status, rules, zones, open ports, and services in a clean format.

---

## 📈 Why It’s Useful

- Ensures firewalls are running and properly configured.
- Helps troubleshoot open ports and exposure issues.
- Quickly checks security posture across distributions (Ubuntu, CentOS, etc.).
- Ideal for routine security audits or post-deployment checks.

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x firewall_status_check.sh
```

### 2. Run the script:

```bash
./firewall_status_check.sh
```

> ⚠️ Most commands require root access. Run with `sudo` for full output:
>
> ```bash
> sudo ./firewall_status_check.sh
> ```

---

## 📄 Notes

- If no supported firewall tool is found, the script will display an appropriate message.
- Safe to run on any major Linux distribution.

## Sample Image

