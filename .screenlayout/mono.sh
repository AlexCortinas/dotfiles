#!/bin/sh
xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output VGA1 --off
#xrandr --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal
xrandr --output LVDS1 --auto

feh --bg-fill ~/Imaxes/wallpaper.jpg
