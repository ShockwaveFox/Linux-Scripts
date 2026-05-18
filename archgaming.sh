#!/bin/bash

# sets script to stop at errors
set -e

# print
echo "Updating system"

# update system
sudo pacman -Syu

# print
printf "\n===========================================\n\n"

# Print
echo "Installing Arch packages"

sudo pacman -S \
steam gamemode lib32-gamemode \
goverlay mangohud lib32-mangohud \
vulkan-radeon lib32-vulkan-radeon vulkan-tools mesa \
discord pavucontrol apparmor ufw clamav

printf "\n===========================================\n\n"

# print to screen
echo "Installing yay"

# install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

printf "\n===========================================\n\n"

echo "Installing AUR packages"

# install AUR packages
yay -S heroic-games-launcher-bin protonplus eduke32

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
