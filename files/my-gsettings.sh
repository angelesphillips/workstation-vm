#!/usr/bin/bash

# Use 12-hour clock format instead of 24-hour
gsettings set org.gnome.desktop.interface clock-format '12h'

# Display seconds in the top-bar clock
gsettings set org.gnome.desktop.interface clock-show-seconds true

# Enable the gnome-tweaks extension that shows the window list
gsettings set org.gnome.shell enabled-extensions "['window-list@gnome-shell-extensions.gcampax.github.com']"

# Turn off keyboard repeats
gsettings set org.gnome.desktop.peripherals.keyboard repeat false

