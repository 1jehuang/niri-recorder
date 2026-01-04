# Multi-terminal demo
# Shows two terminals side by side

output: multi-terminal.gif
nested: true
width: 50%
height: 80%

# First terminal - run a command
run: echo "Terminal 1"
sleep: 500ms

# Create second terminal
terminal: term2
sleep: 300ms

run: echo "Terminal 2"
sleep: 500ms

# Switch back to first terminal
terminal: main
sleep: 200ms

run: echo "Back to terminal 1"
sleep: 500ms

# Switch to second terminal again
terminal: term2
sleep: 200ms

run: echo "Back to terminal 2"
sleep: 500ms
