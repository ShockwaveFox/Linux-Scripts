#!/bin/bash

# one liner yay command - arch & aur packages
yay steam discord goverlay mangohud lib32-mangohud gamemode lib32-gamemode vulkan-radeon lib32-vulkan-radeon vulkan-tools mesa pavucontrol heroic-games-launcher-bin protonplus apparmor ufw clamav eduke32

# list of packages to install
arch_packages=(steam discord goverlay mangohud lib32-mangohud gamemode lib32-gamemode vulkan-radeon lib32-vulkan-radeon vulkan-tools mesa pavucontrol)
aur_packages=(heroic-games-launcher-bin protonplus)
security_packages=(apparmor ufw clamav)

# sets script to stop at any errors, undefined variables or piping failures
set -euo pipefail

# prints message to screen
echo "Updating system"

# update system
sudo pacman -Syu

# prints message to screen
printf "\n===========================================\n\n"

# Prints message to screen
echo "Installing Arch packages"

# installs Arch packages
sudo pacman -S --needed "${arch_packages[@]}"

# prints message to screen
printf "\n===========================================\n\n"

# Prints message to screen
echo "Installing yay"

# installs yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# prints message to screen
printf "\n===========================================\n\n"

# Prints message to screen
echo "Installing AUR packages"

# installs AUR packages
yay -S --needed "${aur_packages[@]}"

# prints message to screen
printf "\n===========================================\n\n"

# Prints message to screen
echo "Installing Security packages"

sudo pacman -S --needed "${security_packages[@]}"

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
