render() {
  VALUE=$(cat /sys/class/backlight/intel_backlight/brightness)
  PERCENTAGE=$(expr $VALUE \* 100 / $MAX_VALUE)
  echo $PERCENTAGE
}

MAX_VALUE=$(cat /sys/class/backlight/intel_backlight/max_brightness)
render

inotifywait -q -m -e modify /sys/class/backlight/intel_backlight/brightness | 
  while read file_path file_event file_name; do
    render
  done
