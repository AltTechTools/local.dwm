#!/bin/bash
cd "$HOME/.dwm"
. ./genericdmenuargfilter.sh
dwmargs=$(filter_dmenuArgs "${@}")
source menus/selectsource.sh
#//test
#selectedsubmenu="$(./confselect.sh menus/menu_List.conf)"
#return 0

echo "$(_start_SelectionDefault List)"
