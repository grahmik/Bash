#!/bin/bash

# Aggressive Linux Enumeration Script

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Create a directory to store the results
output_dir="/tmp/aggressive_enum"
mkdir -p "$output_dir"

# Basic system information
echo "Hostname: $(hostname)" > "$output_dir/system_info.txt"
echo "Kernel: $(uname -a)" >> "$output_dir/system_info.txt"
echo "Logged in users:" >> "$output_dir/system_info.txt"
who >> "$output_dir/system_info.txt"
echo "-----------------------------------" >> "$output_dir/system_info.txt"

# Network information
ifconfig -a > "$output_dir/network_info.txt"
echo "-----------------------------------" >> "$output_dir/network_info.txt"
netstat -tuln >> "$output_dir/network_info.txt"
echo "-----------------------------------" >> "$output_dir/network_info.txt"
ss -tuln >> "$output_dir/network_info.txt"

# Installed software
dpkg -l > "$output_dir/installed_software.txt"
echo "-----------------------------------" >> "$output_dir/installed_software.txt"
rpm -qa >> "$output_dir/installed_software.txt"

# User and group information
cat /etc/passwd > "$output_dir/passwd_info.txt"
cat /etc/group > "$output_dir/group_info.txt"

# Enumerate open ports and services
nmap -p- -T4 127.0.0.1 > "$output_dir/open_ports.txt"

# Disk and filesystem information
df -h > "$output_dir/disk_info.txt"
cat /etc/fstab > "$output_dir/fstab_info.txt"

# Process and running services
ps aux > "$output_dir/processes.txt"
systemctl list-units --type=service --all > "$output_dir/services.txt"

echo "Aggressive enumeration completed. Results stored in: $output_dir"
