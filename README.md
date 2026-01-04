# niri-recorder

Automated screen recording for the Niri compositor. Create scripted terminal recordings with a simple tape format.

## The Problem

You want to record a demo of a terminal app but:
- Manual recording requires perfect timing
- vhs only works in a virtual terminal (no real transparency/wallpaper)
- You want your actual environment with transparency and wallpaper visible

## The Solution

niri-recorder spawns a real Kitty terminal, controls it via remote socket, records with wf-recorder, and converts to GIF. Your actual terminal config (transparency, fonts, colors) is captured.

## Requirements

- Niri compositor
- Kitty terminal (non-nested mode)
- foot terminal (nested mode)
- wtype (nested mode)
- wf-recorder
- ffmpeg

## Nested Mode (Recommended)

Use `--nested` to run the recording inside a nested niri window. This way you can keep working while it records:

```bash
niri-recorder --nested demo.tape
```

Or in your tape file:
```tape
nested: true
output: demo.gif
...
```

**How it works:**
- Spawns a nested niri compositor (runs as a window in your main session)
- Recording and terminal automation happen entirely inside the nested compositor
- Fully automatic - no clicking or selection required
- You can minimize or move the nested window aside while it records

## Install

```bash
git clone https://github.com/1jehuang/niri-recorder
cd niri-recorder
chmod +x niri-recorder
sudo ln -s $(pwd)/niri-recorder /usr/local/bin/
```

## Usage

Create a tape file:

```tape
# demo.tape
output: demo.gif
width: 80%
height: 80%
workspace: 9

run: clear
sleep: 500ms

run: ffp
sleep: 1s

type: main
sleep: 800ms

key: down
sleep: 300ms
key: down
sleep: 300ms

key: escape
sleep: 300ms
```

Run it:

```bash
niri-recorder demo.tape
```

## Tape Format

### Config Options

| Option | Default | Description |
|--------|---------|-------------|
| `output` | recording.gif | Output file path |
| `width` | 80% | Window width |
| `height` | 80% | Window height |
| `workspace` | 9 | Workspace to record on (non-nested mode) |
| `fps` | 12 | GIF frame rate |
| `scale` | 800 | GIF width in pixels |
| `nested` | false | Run inside nested niri |

### Commands

| Command | Example | Description |
|---------|---------|-------------|
| `run` | `run: echo hello` | Type text and press Enter |
| `type` | `type: hello` | Type text without Enter |
| `key` | `key: enter` | Send a key |
| `sleep` | `sleep: 500ms` | Wait |

### Supported Keys

`enter`, `escape`, `up`, `down`, `left`, `right`, `tab`, `backspace`, `ctrl+u`, `ctrl+c`, `ctrl+d`, `ctrl+w`

## Example

Record a demo of ffp (fast file picker):

```tape
output: ffp-demo.gif
width: 80%
height: 80%

run: clear
sleep: 300ms

run: ffp
sleep: 1.5s

type: readme
sleep: 800ms

key: down
sleep: 400ms
key: up
sleep: 400ms

key: ctrl+u
sleep: 300ms

type: main
sleep: 800ms

key: escape
sleep: 300ms
```
