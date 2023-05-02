#!/bin/bash

win_home=$(wslpath "$(wslvar USERPROFILE)")

# Change to class REPO directory
sleep 1
echo " "
echo "Changing Directories to BOOTCAMP REPO" && cd $win_home/Documents/KU/Repo/KU-VIRT-CYBER-PT-03-2023-U-LOLC
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
if [ ! -d $HOME/Logs ]; then
    mkdir -p $HOME/Logs
fi
echo -n "git pull successful: " >> $HOME/Logs/REPO.log
date >> $HOME/Logs/REPO.log

# Goodbye
echo "Goodbye"
