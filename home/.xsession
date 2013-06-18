#!/usr/bin/env bash

gnome-settings-daemon &   # themes, screensaver, power management
exec i3
