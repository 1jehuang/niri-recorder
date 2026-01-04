# FFP Demo Recording
# Shows fuzzy file picker with search and navigation

output: ffp-demo.gif
width: 80%
height: 80%
workspace: 9

# Start fresh
run: clear
sleep: 300ms

# Launch ffp
run: ffp
sleep: 1.5s

# Search for "readme"
type: readme
sleep: 800ms

# Navigate
key: down
sleep: 400ms
key: down
sleep: 400ms
key: up
sleep: 400ms

# Clear and try another search
key: ctrl+u
sleep: 300ms

type: main
sleep: 800ms

# Exit
key: escape
sleep: 300ms
