#!/bin/bash
exec > ~/.logs/xsession 2>&1
export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB.UTF-8"

#nitrogen --restore &
#nm-applet &
#dunst &
#picom -b --experimental-backends --dbus &
#gnome-screensaver &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)


~/.dwm/bin/status.sh 2> ~/.logs/status &
#~/.dwm/dwm 2> ~/.logs/dwm
dwm 2> ~/.logs/dwm
