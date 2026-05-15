#!/bin/bash

# list of packages to install
solus_packages=(steam heroic-games-launcher discord goverlay mangohud gamemode gamemode-32bit vulkan vulkan-32bit vulkan-tools mesalib mesalib-32bit pavucontrol)
security_packages=(apparmor ufw clamav)

# sets script to stop at any errors, undefined variables or piping failures
set -euo pipefail

# prints message to screen
echo "Updating system"

# update system
sudo eopkg upgrade

# prints message to screen
printf "\n===========================================\n\n"

# Prints message to screen
echo "Installing Solus packages"

# installs Arch packages
sudo eopkg install "${solus_packages[@]}"

# prints message to screen
printf "\n===========================================\n\n"

# Prints message to screen
echo "Installing Security packages"

sudo eopkg install "${security_packages[@]}"

# prints message to screen
printf "\n===========================================\n\n"

# Prints message to screen
echo "Enabling Security packages"

# enable security packages
sudo systemctl enable --now ufw
sudo systemctl enable --now apparmor
sudo systemctl enable --now clamav-freshclam

# prints message to screen
printf "\n===========================================\n\n"

# Prints message to screen
echo "Setting Firewall rules"

# set ufw rules
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# prints message to screen
printf "\n===========================================\n\n"

# Prints message to screen
echo "installation complete"
