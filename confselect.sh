#!/bin/bash

#e.g.: 
#./confselect.sh keypress_List.conf --dmenu '-l 8' --dmenu-prompt "test" --dmenu-font "monospace:size=36" --dmenu-nb "#FF0000"
#$1=menu_List.conf
#$2=dmenu -l 9 -p "Select Action: " -fn "monospace:size=72"
#echo "$@"
#echo "each"
#echo "$0" #script name
#echo "$1" #file name 
#echo "$2" #setting indicator e.g. --demenu
#echo "$3" #setting e.g. dmenu
#echo "$4"
#echo "$5"
#dmenuargs="$3"
#echo "$3"

#declare -a paramArr
paramArr=()
dmenuargs=""
dmenuprompt=""
dmenuargstot=""

for param in "$@" 
do
    paramArr+=("${param}");
done

dmenuargstot=$(./testgeneralised.sh "${@}")


if false; then
for (( i=0; (i+1)<${#paramArr[@]}; i++))
do
  case "${paramArr[i]}" in
    "-h" | "--help")
      echo "e.g.:./confselect.sh keypress_List.conf --dmenu '-l 8' --dmenu-prompt \"test\" --dmenu-font \"monospace:size=36\" --dmenu-nb \"#FF0000\""
      echo "-h/--help: This Help"
      exit
    ;;
    "--dmenu")
#      dmenuargs="${paramArr[i+1]}"
      dmenuargstot="$dmenuargstot ${paramArr[i+1]}"
   ;;
   "--dmenu-prompt")
#     dmenuprompt="${paramArr[i+1]}"
     dmenuargstot="$dmenuargstot -p ${paramArr[i+1]}"
   ;;
   "--dmenu-font")
     dmenuargstot="$dmenuargstot -fn ${paramArr[i+1]}"
   ;;
   "--dmenu-nb")
     dmenuargstot="$dmenuargstot -nb ${paramArr[i+1]}"
   ;;
   "--dmenu-nf")
     dmenuargstot="$dmenuargstot -nf ${paramArr[i+1]}"
   ;;
   "--dmenu-sb")
     dmenuargstot="$dmenuargstot -sb ${paramArr[i+1]}"
   ;;
   "--dmenu-sf")
     dmenuargstot="$dmenuargstot -sf ${paramArr[i+1]}"
   ;;
  esac
done
fi

#echo "${dmenuargstot}"



if [ "${#dmenuargs}" -lt 1 ]; then
  dmenuargs='-l 9 -p "Select Action: " -fn "monospace:size=72"'
fi
#echo "$dmenuargs"

menulist=$(grep -v "#" "$1")
#selected=$(echo "$menulist" | awk '{print $1}' FS=";" | dmenu $dmenuargs -p "$dmenuprompt")
#selected=$(echo "$menulist" | awk '{print $1}' FS=";" | dmenu $(echo "$dmenuargstot"))
selected=$(echo "$menulist" | awk '{print $1}' FS=";" | dmenu $dmenuargstot)
#echo "$menulist" | grep "$selected;" | awk '{print $2}' FS=";"
echo "$menulist" | grep -- "^${selected};" | sed "s/$selected;//"
