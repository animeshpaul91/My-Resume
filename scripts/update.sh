#!/bin/bash

# Download, install new packages and purge obsolete packages
echo $password | sudo -S apt update
echo $password | sudo -S apt -y upgrade
echo $password | sudo -S apt -y autoclean
echo $password | sudo -S apt -y autoremove

# Snap Update
sudo killall snap-store
sudo killall gnome-software
sudo snap refresh

# Stop Tomcat Service
sudo service tomcat stop

# Stop Jetty Service
sudo service jetty9 stop
