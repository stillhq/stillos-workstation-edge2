#!/usr/bin/env bash

set -xeuo pipefail

if [[ "${VARIANT}" == "workstation" ]]; then
    echo "Building workstation variant (base variant, no additional packages)"
    # No additional packages for base variant

elif [[ "${VARIANT}" == "workstation-nvidia" ]]; then
    echo "Building workstation-nvidia variant"
    
    # Install RPM Fusion repositories (required for NVIDIA packages)
    dnf install --nogpgcheck -y \
        https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm
    
    # Install NVIDIA drivers and related packages
    dnf install -y \
        akmod-nvidia \
        xorg-x11-drv-nvidia-cuda \
        nvidia-vaapi-driver \
        libva-utils \
        vdpauinfo

else
    echo "Unknown variant: ${VARIANT}"
    exit 1

fi
