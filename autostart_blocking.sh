#!/bin/sh
pulseaudio --start #you will never run any headphones ever again else
#if no default is given, update Backgrounds List
test -e defaultBG.conf || ./updatedefaultBackgrounds.sh
#test -e defaultBG.conf && ./setdefaultBackground.sh
#exec svkbd-mobile-intl &
