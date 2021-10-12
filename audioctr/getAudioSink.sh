#!/bin/sh
echo $(pactl info | grep -e ".a2dp_sink" -e "alsa_output." | awk '{print $2}')

