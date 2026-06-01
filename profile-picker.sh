#!/usr/bin/env bash

HYPRDIR="$HOME/.config/hypr"
PROFILEDIR="$HYPRDIR/profiles"

CHOICE="$(ls $PROFILEDIR | rofi -dmenu)"

rm $HYPRDIR/cur_profile.lua

ln -s $PROFILEDIR/$CHOICE $HYPRDIR/cur_profile.lua

hyprctl reload
