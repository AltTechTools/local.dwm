#!/bin/sh
cd "$HOME/.dwm/"
test "$(cat defaultBG.conf)" = "" && rm defaultBG.conf && return 1
test -e  "./Backgrounds/$(cat defaultBG.conf)" && feh --bg-scale "./Backgrounds/$(cat defaultBG.conf)"
test -e  "./Backgrounds/$(cat defaultBG.conf)" || rm defaultBG.conf
