#!/bin/sh

gnome-power-manager &     # laptop power management
gnome-settings-daemon &   # themes, gnome-screensaver
gnome-volume-manager &    # mounting volumes
exec i3
