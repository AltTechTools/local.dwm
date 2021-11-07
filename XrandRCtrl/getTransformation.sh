#!/bin/sh

case "$1" in
	"left")
		echo "0 -1 1 1 0 0 0 0 1"
	;;
	"right")
		echo "0 1 0 -1 0 1 0 0 1"
	;;
	"inverted")
		echo "-1 0 1 0 -1 1 0 0 1"
	;;
	* )
		echo "1 0 0 0 1 0 0 0 1"
	;;
esac
