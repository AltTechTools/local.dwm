#!/bin/sh
ls "Backgrounds/" | awk '{print $1";"$1"."$2}' FS="." > menus/autogen_ListBackground.conf

