#!/bin/bash

#declare -a paramArr
paramArr=()
dmenuargs=""
dmenuprompt=""
dmenuargstot=""

for param in "$@" 
do
    paramArr+=("${param}");
done

#always expects >1 param, since the last one is not processed
#for (( i=0; (i+1)<${#paramArr[@]}; i++))
#was there a reason?
#now does every param

for (( i=0; (i+1)<=${#paramArr[@]}; i++))
do
  case "${paramArr[i]}" in
    "-h" | "--help")
      echo "e.g.:./confselect.sh keypress_List.conf --dmenu '-l 8' --dmenu-prompt \"test\" --dmenu-font \"monospace:size=36\" "
      echo "-h/--help: This Help"
      exit
    ;;
    "--dmenu")
#      dmenuargs="${paramArr[i+1]}"
      dmenuargstot="$dmenuargstot ${paramArr[i+1]}"
   ;;
   "--dmenu-prompt" | "-p")
#     dmenuprompt="${paramArr[i+1]}"
     dmenuargstot="$dmenuargstot -p ${paramArr[i+1]}"
   ;;
   "--dmenu-font" | "-fn")
     dmenuargstot="$dmenuargstot -fn ${paramArr[i+1]}"
   ;;
   "--dmenu-nb" | "-nb")
     dmenuargstot="$dmenuargstot -nb ${paramArr[i+1]}"
   ;;
   "--dmenu-nf" | "-nf")
     dmenuargstot="$dmenuargstot -nf ${paramArr[i+1]}"
   ;;
   "--dmenu-sb" | "-sb")
     dmenuargstot="$dmenuargstot -sb ${paramArr[i+1]}"
   ;;
   "--dmenu-sf" | "-sf")
     dmenuargstot="$dmenuargstot -sf ${paramArr[i+1]}"
   ;;
   "--dmenu-length" | "-l")
	dmenuargstot="$dmenuargstot -l ${paramArr[i+1]}"
   ;;
   *)
#	echo "not recongized ${paramArr[i]} (index $i)"
   ;;
  esac
done

echo "${dmenuargstot}"

