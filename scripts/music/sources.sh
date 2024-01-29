#!/bin/sh

playerctl metadata -F -a -f ""  |
while read -r line; do
  SOURCE_NUMBER=$(playerctl -l | wc -l)
  echo $SOURCE_NUMBER
done

