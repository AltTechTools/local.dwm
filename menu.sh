#!/bin/bash
cd "$HOME/.dwm"
#source ./genericdmenuarg.src
#. ./genericdmenuargfilter.sh
source menus/selectsource.src
dwmargs=$(filter_dmenuArgs "${@}")
#echo "${dwmargs}" > dwmargs.txt

#//test
#selectedsubmenu="$(./confselect.sh menus/menu_List.conf)"
#return 0

echo "$(_start_SelectionDefault List)"
