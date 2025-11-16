#!/bin/bash

# Download, install new packages and purge obsolete packages
echo $password | sudo -S apt update
echo $password | sudo -S apt -y upgrade
echo $password | sudo -S apt -y autoclean
echo $password | sudo -S apt -y autoremove
echo $password | sudo -S journalctl --vacuum-time=7d

# Snap Update
sudo killall snap-store
sudo killall gnome-software
sudo snap refresh

# Stop Tomcat Service
sudo service tomcat stop

# Stop Jetty Service
sudo service jetty9 stop

# Clear uTorrent Trash and torrent files
TARGETS=(
    "${HOME}/snap/utorrent/current/.local/share/Trash/files"
    "${HOME}/snap/utorrent/current/utorrent"
)

for TARGET in "${TARGETS[@]}"; do
    if [[ "$TARGET" == *Trash* ]]; then
        find "$TARGET" -mindepth 1 -maxdepth 1 -exec rm -rf {} +
    else
        find "$TARGET" -maxdepth 1 -type f -name "*.torrent" -exec rm -f {} +
    fi
done
