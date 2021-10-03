#!/bin/sh
cd "$HOME/.dwm"

#picpath="$HOME/Bilder/"
#picname="background.png"
#test -e "$picpath$picname" && ln -s "$picpath$picname" "Backgrounds/$picname" #&& echo "true" #ln -s ""

link () {
	test -e "$1$2" && ln -s -f "$1$2" "Backgrounds/$2" && echo "linked $1$2"
}

link "$HOME/Bilder/" "background.png"
link "$HOME/Bilder/" "background.jpg"
link "$HOME/Pictures/" "background.png"
link "$HOME/Pictures/" "background.jpg"
