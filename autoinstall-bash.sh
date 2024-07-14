#!/bin/bash

# Use this script as a bootstrap
# script is used to update ubuntu and create user then configures firewall, timezone and installs softwares

# Update and upgrade system
apt-get update
apt-get upgrade -y


# Create user
USERNAME="mgmt"
PASSWORD='$6$ZE4WV3QRJhPUnsNv$BpkTBYjUOxOiWV5sNPYDSitTwxW.3NHLmhRqptzpa8a4KTxGpkvMaSDbyq4PVri9kdpD1t7ldUBgwB6uveObg.'
useradd -m -s /bin/bash -p "$PASSWORD" "$USERNAME"
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/"$USERNAME"

# Configure storage (assuming LVM is already set up in the environment)
# This part typically needs manual configuration during installation or can be handled by cloud-init/automation tools.


snap refresh
# Install software phase
snap install obsidian --classic
snap install code --classic

# install packages
apt-get install -y vim

# Enable and configure firewall
ufw enable
ufw allow 22/tcp
ufw allow 443/tcp
ufw insert 1 deny proto icmp
ufw insert 1 limit proto icmp
ufw limit 22/tcp

# Set timezone
timedatectl set-timezone 'America/Chicago'

# Install additional software
apt-get install -y lynis git

# Ensure everything is up-to-date
apt-get update
apt-get upgrade -y

echo "Setup complete."
