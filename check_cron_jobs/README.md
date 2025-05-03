# 🕒 Check Cron Jobs

**Cron jobs** and **systemd timers** are essential for automating repetitive tasks on Linux systems — such as backups, log rotation, updates, and health checks. However, as systems grow more complex, it's easy to lose track of all the scheduled tasks configured across users and services.

This script provides a comprehensive overview of all cron jobs and systemd timers set up on a Linux machine. It helps system administrators audit, verify, and troubleshoot scheduled automation in a single, organized report.

---

## 📌 What Is This Script?

`check_cron_jobs.sh` is a lightweight, readable tool to scan for and display all scheduled tasks set up using:

- User crontabs
- System-wide crontab files
- `/etc/cron.d` job files
- Daily, weekly, monthly, and hourly cron jobs
- Systemd timer units

---

## 🎯 Why Monitor Cron Jobs?

Monitoring scheduled tasks is essential to:

- Ensure backups, updates, and maintenance scripts are running as expected.
- Detect orphaned or outdated jobs left behind by uninstalled software.
- Verify time-sensitive tasks in production environments.
- Prevent job conflicts or overload during peak hours.

---

## 🔍 What This Script Monitors

| Source                     | Description                                      |
|---------------------------|--------------------------------------------------|
| User Crontabs             | Lists active cron jobs for each user on the system. |
| `/etc/crontab`            | Displays non-comment lines in the system-wide crontab. |
| `/etc/cron.d/`            | Checks all job files in the `cron.d` directory.  |
| `/etc/cron.{daily,weekly,monthly,hourly}` | Lists scripts in standard cron job folders. |
| Systemd Timers            | Lists all timers defined and managed by systemd. |

---

## 🧠 How It Works

- Iterates over all system users and attempts to list their crontab entries.
- Parses `/etc/crontab` and `/etc/cron.d/` for non-commented job entries.
- Lists available scripts from cron interval directories (daily, weekly, etc.).
- Uses `systemctl list-timers` to show all active and inactive systemd timers.

Output is categorized and clearly labeled for quick review.

---

## 📈 Why It’s Useful

- Gives **a single view** of all scheduled jobs across your system.
- Helps in **compliance auditing** and **post-incident reviews**.
- Useful for teams managing multiple servers without needing GUI tools.
- Works across most Linux distributions.

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x check_cron_jobs.sh
```

### 2. Run the script:

```bash
./check_cron_jobs.sh
```

> Run as a user with permission to read crontabs. For full system-wide visibility, `sudo` is recommended.

---

## 📄 Notes

- The script suppresses empty or commented lines to keep the output clean.
- For systems without `systemd`, the timer section will notify that it’s not available.

## Sample Image
