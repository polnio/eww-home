CALENDAR=$(~/Documents/prog/org_extractor/main2.py | jq -c 'group_by(.date) | map(group_by(.matiere))')
echo $CALENDAR
