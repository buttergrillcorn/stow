#!/bin/sh
systemctl --user add-wants niri.service waybar.service
systemctl --user add-wants niri.service dunst.service
