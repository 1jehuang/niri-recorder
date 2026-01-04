# Open 3 Firefox windows and ffp
output: ~/Videos/firefox-ffp.mp4
nested: true
width: 80%
height: 80%

# Open first Firefox (use $WAYLAND_DISPLAY from nested env)
run: firefox --new-instance &
sleep: 3s

# Open second Firefox
run: firefox --new-instance &
sleep: 3s

# Open third Firefox
run: firefox --new-instance &
sleep: 3s

# Now open ffp
run: ffp
sleep: 5s

# Browse around in ffp
key: down
sleep: 500ms
key: down
sleep: 500ms
key: down
sleep: 500ms
key: up
sleep: 500ms

type: readme
sleep: 2s

key: ctrl+u
sleep: 500ms

type: .png
sleep: 3s

# Select a file
key: enter
sleep: 2s

# Wait to show result
sleep: 8s
