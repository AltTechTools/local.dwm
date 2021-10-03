activesink=$(pactl info | grep "__sink" | awk '{print $2}')

#pactl set-sink-volume "$activesink" +0.75
echo "$activesink"

