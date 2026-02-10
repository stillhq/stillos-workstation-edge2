#!/usr/bin/env bash

set -xeuo pipefail

echo "Installing extra package groups"
dnf install -y --nobest  \
    @development \
    @legacy-unix \
    @rpm-development-tools \
    @system-tools

echo "Swapping GNOME"
dnf remove -y gnome-shell-extension-background-logo
dnf swap -y gnome-shell https://download.copr.fedorainfracloud.org/results/still/stillos-alma/alma+epel-10-x86_64_v2/10113620-gnome-shell/gnome-shell-47.4-3.el10.still.1.x86_64_v2.rpm
dnf swap -y mutter https://download.copr.fedorainfracloud.org/results/still/stillos-alma/epel-10-x86_64/10110199-mutter/mutter-47.5-8.el10.x86_64.rpm
dnf swap -y gnome-session-wayland-session stillos-session
dnf swap -y ptyxis still-terminal

echo "Installing stillOS Packages"
dnf install -y https://kojipkgs.fedoraproject.org//packages/gnome-shell-extension-just-perfection/35.0/1.el10_2/noarch/gnome-shell-extension-just-perfection-35.0-1.el10_2.noarch.rpm
dnf install -y https://kojipkgs.fedoraproject.org//packages/micro/2.0.11/10.fc41/x86_64/micro-2.0.11-10.fc41.x86_64.rpm
dnf install -y rsms-inter-fonts rsms-inter-vf-fonts still-control stillcenter swai swai-inst stillcount-client adw-gtk3-theme gnome-shell-extension-desktop-icons-ng gnome-shell-extension-appindicator stillexplore quick-setup still-zsh

echo "Installing misc packages..."
dnf install -y git lorax \
    distrobox \
    fuse \
    xdg-utils \
    glib2-devel \
    ntfs-3g \
    exfat-utils \
    wireguard-tools \
    NetworkManager-openvpn-gnome \
    lldb \
    gdb

# Removing Unused Software
dnf remove -y gnome-software gnome-tour gnome-extensions-app
dnf remove firefox -y
dnf config-manager --save --setopt=exclude=firefox
dnf autoremove

# Disable Command Not Found PackageKit
sed -i -e 's/^SoftwareSourceSearch=true/SoftwareSourceSearch=false/' /etc/PackageKit/CommandNotFound.conf

# Turn on ZSH
sed -i 's|^SHELL=.*|SHELL=/bin/zsh|' /etc/default/useradd

systemctl disable rpm-ostree-countme.service
systemctl enable stillcount.service
systemctl enable sam.service

