render() {
  VALUE=$(pamixer --get-volume)
  echo $VALUE
}
render

pactl subscribe | grep --line-buffered "sink" |
while read -r line; do
  render
done
