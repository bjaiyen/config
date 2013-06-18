#!/usr/bin/env bash

gnome-power-manager &     # power management
gnome-settings-daemon &   # themes, gnome-screensaver
gnome-volume-manager &    # mounting volumes
exec i3
