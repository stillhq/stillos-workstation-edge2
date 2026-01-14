#!/usr/bin/env bash

set -xeuo pipefail

dnf install -y still-bundler

still-bundler ci-build \
    org.gnome.Epiphany \
    com.github.tchx84.Flatseal \
    de.haeckerfelix.Shortwave \
    org.gnome.Contacts \
    ca.edestcroix.Recordbox \
    org.gnome.Podcasts \
    org.gnome.SoundRecorder \
    com.github.maoschanz.drawing \
    com.belmoussaoui.Authenticator \
    org.gnome.World.Secrets \
    io.gitlab.news_flash.NewsFlash \
    com.rafaelmardojai.Blanket \
    org.onlyoffice.desktopeditors \
    app.drey.Warp \
    -o /path/to/flatpak-bundle.tar.xz \
    --i-understand-this-will-reset-flatpak