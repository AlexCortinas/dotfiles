#!/bin/sh
xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --off
#xrandr --output HDMI3 --mode 1920x1080 --pos 0x0 --rotate normal --output VGA1 --mode 1920x1080 --pos 1920x0 --rotate normal
xrandr --output HDMI3 --auto --primary --output VGA1 --auto --right-of HDMI3
xrandr --output HDMI3 --auto --primary --output VGA1 --auto --right-of HDMI3

feh --bg-fill ~/Imaxes/wallpaper.jpg
