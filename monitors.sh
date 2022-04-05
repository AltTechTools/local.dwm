#!/bin/sh
xrandr  --output HDMI1 --auto
xrandr  --output HDMI1 --left-of LVDS1
$HOME/.dwm/setdefaultBackground.sh
