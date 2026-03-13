# append

A minimal bash tool for versioned file editing. Archive the current version of any file and open a fresh one instantly — or drop into read-only mode to review before you write.

## What it does

Running `append script.sh` archives your current file as `script.sh1` (then `script.sh2`, `script.sh3`, etc.) and opens a blank file ready to write. Every old version is preserved automatically.

## Install

```bash
git clone https://github.com/tux-tech/append/
cd append
sudo cp append /usr/local/bin/append
sudo chmod +x /usr/local/bin/append
```

## Usage

```bash
append filename
```

### Normal flow (file exists with content)

```
Read or append 'script.sh'? [A=append / r=read]:
```

| Input | Action |
|-------|--------|
| Enter *(default)* | Archives current file, opens blank new version in nano |
| `a` | Same as above |
| `r` | Opens file read-only in nano (`-v` view mode) |
| anything else | Aborts |

The prompt stays out of your way — just hit Enter to keep moving.

### Edge cases

| Situation | Behaviour |
|-----------|-----------|
| File doesn't exist | Asks if you want to create it |
| File exists but is empty | Warns you, asks to continue or abort |

## How versioning works

```
script.sh       ← current (what you just wrote)
script.sh1      ← previous
script.sh2      ← older
script.sh3      ← oldest
```

Each `append` run increments the highest existing version number, so nothing is ever overwritten.

## Requirements

- bash
- nano
- sudo (for writing to protected locations)
