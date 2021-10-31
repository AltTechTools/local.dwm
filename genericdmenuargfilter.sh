#!/bin/bash

filter_dmenuArgs(){
#declare -a paramArr
paramArr=()
dmenuargs=""
dmenuprompt=""
dmenuargstot=""
dmenuargsorig=""

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
      dmenuargstot="${dmenuargstot} ${paramArr[i+1]}"
      dmenuargsorig="${dmenuargsorig} --dmenu ${paramArr[i+1]}"
	DWM_DMENU_GENERALPARAM="${paramArr[i+1]}" # doesn't work, due to being a sub process?
	export DWM_DMENU_GENERALPARAM
   ;;
   "--dmenu-length" | "-l")
      dmenuargstot="${dmenuargstot} -l ${paramArr[i+1]}"
      dmenuargsorig="${dmenuargsorig} --dmenu-length ${paramArr[i+1]}"
	DWM_DMENU_LENGTH="${paramArr[i+1]}"
	export DWM_DMENU_LENGTH
   ;;
   "--dmenu-prompt" | "-p")
#     dmenuprompt="${paramArr[i+1]}"
     dmenuargstot="${dmenuargstot} -p ${paramArr[i+1]}"
     dmenuargsorig="${dmenuargsorig} --dmenu-prompt ${paramArr[i+1]}"
	DWM_DMENU_PROMPT="${paramArr[i+1]}"
	export DWM_DMENU_PROMPT
   ;;
   "--dmenu-font" | "-fn")
     dmenuargstot="${dmenuargstot} -fn ${paramArr[i+1]}"
     dmenuargsorig="${dmenuargsorig} --dmenu-font ${paramArr[i+1]}"
	DWM_DMENU_FONT="${paramArr[i+1]}"
	export DWM_DMENU_FONT
   ;;
   "--dmenu-nb" | "-nb")
     dmenuargstot="${dmenuargstot} -nb ${paramArr[i+1]}"
     dmenuargsorig="${dmenuargsorig} --dmenu-nb ${paramArr[i+1]}"
	DWM_DMENU_NB="${paramArr[i+1]}"
	export DWM_DMENU_NB
   ;;
   "--dmenu-nf" | "-nf")
     dmenuargstot="${dmenuargstot} -nf ${paramArr[i+1]}"
     dmenuargsorig="${dmenuargsorig} --dmenu-nf ${paramArr[i+1]}"
	DWM_DMENU_NF="${paramArr[i+1]}"
	export DWM_DMENU_NF
   ;;
   "--dmenu-sb" | "-sb")
     dmenuargstot="${dmenuargstot} -sb ${paramArr[i+1]}"
     dmenuargsorig="${dmenuargsorig} --dmenu-nf ${paramArr[i+1]}"
	DWM_DMENU_SB="${paramArr[i+1]}"
	export DWM_DMENU_SB
   ;;
   "--dmenu-sf" | "-sf")
     dmenuargstot="${dmenuargstot} -sf ${paramArr[i+1]}"
     dmenuargsorig="${dmenuargsorig} --dmenu-nf ${paramArr[i+1]}"
	DWM_DMENU_SF="${paramArr[i+1]}"
	export DWM_DMENU_SF
   ;;
   *)
#	echo "not recongized ${paramArr[i]} (index $i)"
   ;;
  esac
done

echo "${dmenuargsorig}"

}
