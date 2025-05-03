# 🔧 Package and Patch Status

Monitoring the status of installed packages, patches, and system updates is crucial for maintaining security and performance. Regular updates prevent vulnerabilities, keep your system optimized, and ensure that the latest features and fixes are available.

This script checks for outdated packages, kernel updates, and available security patches, providing an easy way to ensure your system is up-to-date.

---

## 📌 What Is This Script?

`package_patch_status.sh` is a system administration script that checks for outdated packages, available kernel updates, and missing security patches. It supports multiple Linux distributions and package managers like `apt`, `dnf`, `yum`, `zypper`, and `pacman`.

---

## 🎯 Why Monitor Packages and Patches?

- **Security**: Ensure that your system is protected by applying security patches.
- **Performance**: Keep your packages updated to take advantage of the latest performance improvements.
- **Stability**: Apply patches and kernel updates to keep your system stable and reliable.
- **Compliance**: Regular patching is often required for compliance with security standards.

---

## 🔍 What This Script Monitors

| Metric                  | Description                                                   |
|-------------------------|---------------------------------------------------------------|
| Outdated Packages       | Lists packages that have updates available (based on the package manager). |
| Kernel Updates          | Shows available updates for the Linux kernel.                 |
| Security Patches        | Checks for security-related updates and patches.              |

---

## 🧠 How It Works

- **Outdated Packages**: The script checks for packages that have updates available, depending on the package manager used (`apt`, `dnf`, `yum`, `zypper`, `pacman`).
- **Kernel Updates**: It checks if the system's kernel is outdated and provides relevant update information.
- **Security Patches**: The script scans for security patches that need to be applied, ensuring your system is secure from vulnerabilities.

---

## 📈 Why It’s Useful

- **Security Monitoring**: Ensures that critical security updates are applied promptly.
- **Package Management**: Helps keep your system updated with the latest software versions.
- **Kernel Update Check**: Provides easy visibility on whether the system is running the latest kernel.
- **Cross-Platform Support**: Works across various Linux distributions using different package management tools.

---

## 🛠️ How to Use

### 1. Make the script executable:

```bash
chmod +x package_patch_status.sh
```

### 2. Run the script:

```bash
./package_patch_status.sh
```

> ⚠️ To view complete output (especially for security patches and kernel updates), run with `sudo`:

```bash
sudo ./package_patch_status.sh
```

---

## 📄 Notes

- The script supports multiple Linux distributions (Ubuntu, Debian, CentOS, Fedora, RHEL, SUSE, Arch Linux).
- Requires root privileges to check and display certain package update and kernel status information.
- Depending on your package manager, it may prompt for root access to check for updates.

## Sample Image

