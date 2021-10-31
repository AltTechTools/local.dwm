#!/bin/sh
cd /usr/bin/ #for now only relative to this possible
[ -e "$1" ] || { echo "Datei $1 nicht auffindbar..."; exit 1; }
#echo "Datei gefunden"

cd "$HOME/.dwm"
ln -s -f "/usr/bin/$1" "dwm-default-terminal.ln"
