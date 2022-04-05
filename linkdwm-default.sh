#!/bin/sh
cd "$HOME/.dwm"

case "$1" in 
  "browser")
	path="$PATH"
	lnname="dwm-default-browser.ln"
  ;;
  "terminal")
	path="$PATH"
	lnname="dwm-default-terminal.ln"
  ;;
  "filemgr")
	path="$PATH"
	lnname="dwm-default-filemgr.ln"
  ;;
  "torrent")
	path="$PATH"
	lnname="dwm-default-torrent.ln"
  ;;
  "keyboard")
	path="$PATH"
	lnname="dwm-default-keyboard.ln"
  ;;
  "device")
	path="$HOME/.dwm/dev"
	lnname="dev.ln"
  ;;
  "background")
	path="$HOME/.dwm/Backgrounds"
	lnname="defaultBG.ln"
  ;;
  *)
	path="/tmp"
	lnname="x.ln"
  ;;
esac

for onepath in $(echo "$path" | sed 's/:/\n/g')
do
	[ -e "$onepath/$2" ] && rm "${lnname}"
	[ -e "$onepath/$2" ] && ln -s -f "$onepath/$2" "$lnname" && exit 0
done

>&2 echo "Datei $2 nicht auffindbar..."
notify-send "DWM Link $1" "Datei $2 nicht auffindbar..."
exit 1
