#!/bin/sh
activesink=$(./getAudioSink.sh)

pactl set-sink-mute "$activesink" toggle


