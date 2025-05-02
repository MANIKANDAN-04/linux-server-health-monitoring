#!/bin/bash

echo "============================="
echo "🔧 Package and Patch Status"
echo "============================="

# Function to check for outdated packages
check_outdated_packages() {
    echo -e "\n📦 Checking for outdated packages..."
    outdated_count=0

    if command -v apt-get &> /dev/null; then
        echo "🔍 APT (Ubuntu/Debian):"
        apt_updates=$(sudo apt-get update -qq && sudo apt list --upgradable)
        echo "$apt_updates"
        outdated_count=$(echo "$apt_updates" | grep -c 'upgradable')
        
    elif command -v dnf &> /dev/null; then
        echo "🔍 DNF (Fedora/CentOS/RHEL 8+):"
        dnf_updates=$(sudo dnf check-update)
        echo "$dnf_updates"
        outdated_count=$(echo "$dnf_updates" | wc -l)

    elif command -v yum &> /dev/null; then
        echo "🔍 YUM (CentOS/RHEL 7 and below):"
        yum_updates=$(sudo yum check-update)
        echo "$yum_updates"
        outdated_count=$(echo "$yum_updates" | wc -l)

    elif command -v zypper &> /dev/null; then
        echo "🔍 Zypper (SUSE-based):"
        zypper_updates=$(sudo zypper refresh && sudo zypper list-updates)
        echo "$zypper_updates"
        outdated_count=$(echo "$zypper_updates" | grep -c '^[a-zA-Z]')

    elif command -v pacman &> /dev/null; then
        echo "🔍 Pacman (Arch Linux):"
        pacman_updates=$(sudo pacman -Syu --print)
        echo "$pacman_updates"
        outdated_count=$(echo "$pacman_updates" | wc -l)
        
    else
        echo "❌ No known package manager found!"
    fi

    echo -e "\nTotal outdated packages: $outdated_count"
}

# Function to check for kernel updates
check_kernel_update() {
    echo -e "\n🖥️ Checking for Kernel Updates..."
    kernel_update_count=0

    current_kernel=$(uname -r)

    if command -v apt-get &> /dev/null; then
        echo "🔍 APT (Ubuntu/Debian):"
        apt_kernel_updates=$(sudo apt list --upgradable | grep linux-image)
        echo "$apt_kernel_updates"
        kernel_update_count=$(echo "$apt_kernel_updates" | wc -l)

    elif command -v dnf &> /dev/null; then
        echo "🔍 DNF (Fedora/CentOS/RHEL 8+):"
        dnf_kernel_updates=$(sudo dnf list updates kernel)
        echo "$dnf_kernel_updates"
        kernel_update_count=$(echo "$dnf_kernel_updates" | wc -l)

    elif command -v yum &> /dev/null; then
        echo "🔍 YUM (CentOS/RHEL 7 and below):"
        yum_kernel_updates=$(sudo yum list updates kernel)
        echo "$yum_kernel_updates"
        kernel_update_count=$(echo "$yum_kernel_updates" | wc -l)

    elif command -v zypper &> /dev/null; then
        echo "🔍 Zypper (SUSE-based):"
        zypper_kernel_updates=$(sudo zypper list-updates | grep kernel)
        echo "$zypper_kernel_updates"
        kernel_update_count=$(echo "$zypper_kernel_updates" | wc -l)

    elif command -v pacman &> /dev/null; then
        echo "🔍 Pacman (Arch Linux):"
        pacman_kernel_updates=$(sudo pacman -Qi linux)
        echo "$pacman_kernel_updates"
        kernel_update_count=$(echo "$pacman_kernel_updates" | wc -l)
    fi

    echo -e "\nTotal kernel updates available: $kernel_update_count"
}

# Function to check for security patch status
check_security_patches() {
    echo -e "\n🔒 Checking for Security Patches..."
    security_patch_count=0

    if command -v apt-get &> /dev/null; then
        echo "🔍 APT (Ubuntu/Debian):"
        apt_security_updates=$(sudo apt list --upgradable | grep -i security)
        echo "$apt_security_updates"
        security_patch_count=$(echo "$apt_security_updates" | wc -l)

    elif command -v dnf &> /dev/null; then
        echo "🔍 DNF (Fedora/CentOS/RHEL 8+):"
        dnf_security_updates=$(sudo dnf updateinfo list security)
        echo "$dnf_security_updates"
        security_patch_count=$(echo "$dnf_security_updates" | wc -l)

    elif command -v yum &> /dev/null; then
        echo "🔍 YUM (CentOS/RHEL 7 and below):"
        yum_security_updates=$(sudo yum --security check-update)
        echo "$yum_security_updates"
        security_patch_count=$(echo "$yum_security_updates" | wc -l)

    elif command -v zypper &> /dev/null; then
        echo "🔍 Zypper (SUSE-based):"
        zypper_security_updates=$(sudo zypper patch-check)
        echo "$zypper_security_updates"
        security_patch_count=$(echo "$zypper_security_updates" | wc -l)

    elif command -v pacman &> /dev/null; then
        echo "🔍 Pacman (Arch Linux):"
        pacman_security_updates=$(sudo pacman -Qu | grep -i security)
        echo "$pacman_security_updates"
        security_patch_count=$(echo "$pacman_security_updates" | wc -l)
    fi

    echo -e "\nTotal security patches available: $security_patch_count"
}

# Run all checks
check_outdated_packages
check_kernel_update
check_security_patches

echo -e "\n✅ Package and Patch monitoring complete."
