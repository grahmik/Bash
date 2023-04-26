#!/bin/bash

# Change to class REPO directory
sleep 1
echo " "
echo "Changing Directories to BOOTCAMP REPO" && cd /mnt/d/Documents/KU/Repo/KU-VIRT-CYBER-PT-03-2023-U-LOLC
echo "."
    sleep 1
echo "."
    sleep 1
echo "."
    sleep 1

# Pull class repository
echo "Pulling BOOTCAMP REPO"
echo "."
    sleep 1
echo "."
    sleep 1
echo "."
git pull

# Confirmation of script success sent to log
echo "git pull successful:" >> /home/pinkg/Logs/REPO.log
date > /home/pinkg/Logs/REPO.log

# Goodbye
echo "Goodbye"
