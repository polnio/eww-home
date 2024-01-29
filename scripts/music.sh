#!/bin/bash

playerctl metadata --follow --all-players |
while read -r line; do
    # Extract information from each line
    source=$(echo "$line" | awk '{print $1}')
    key=$(echo "$line" | awk '{print $2}')
    value=$(echo "$line" | awk '{print $3}')

    # Skip lines without values
    [ -z "$value" ] && continue

    # Create or update the associative array
    music_data["$source.$key"]=$value
done

