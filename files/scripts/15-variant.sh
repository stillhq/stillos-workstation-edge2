#!/usr/bin/env bash

set -xeuo pipefail

if [[ "${VARIANT}" == "workstation" ]]; then
    echo "Building workstation variant (base variant, no additional packages)"
    # No additional packages for base variant

elif [[ "${VARIANT}" == "workstation-nvidia" ]]; then
    echo "Building workstation-nvidia variant"
    
    dnf install -y \
        akmod-nvidia \
        xorg-x11-drv-nvidia \
        xorg-x11-drv-nvidia-cuda \
        nvidia-vaapi-driver \
        libva-utils \
        vdpauinfo

else
    echo "Unknown variant: ${VARIANT}"
    exit 1

fi
