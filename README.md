# append

A minimal bash tool for versioned file editing. Archive the current version of any file and open a fresh one instantly — or drop into view mode to review before you write.

Each run rotates the current file to a numbered backup (`file1`, `file2`, ...) and opens a clean version ready to write. Nothing is ever lost.

> **A note on the name:** `append` is what this tool was originally called — and the name stuck. Technically, what it does is *rotate* (archive and renew), which is why the install script suggests `rotate` as the default. But `append` is the canonical name for this repo and works just as well. Call it whatever feels right.


## Install

```bash
git clone https://github.com/tux-tech/append/
cd append
chmod +x install.sh
./install.sh
```

The install script asks what to call the tool:

```
┌─────────────────────────────────────┐
│        rotate — install tool        │
└─────────────────────────────────────┘

  What would you like to call this tool?

  1)  rotate   (recommended)
  2)  append
  3)  custom name

  Choose [1/2/3]:
```

Pick a name, hit Enter — done. The tool installs to `/usr/local/bin/`.

## Usage

```bash
rotate filename
```

### Normal flow (file exists with content)

```
Rotate 'notes.txt'? [Enter=rotate / v=view]:
```

| Input | Action |
|-------|--------|
| Enter *(default)* | Archives current file, opens blank new version in nano |
| `v` | Opens file read-only in nano (view mode) |
| anything else | Aborts |

Just hit Enter to keep moving — it stays out of your way.

### Edge cases

| Situation | Behaviour |
|-----------|-----------|
| File doesn't exist | Asks if you want to create it |
| File exists but is empty | Warns you, asks to edit or abort |

## How versioning works

```
notes.txt     ← current (what you just wrote)
notes.txt1    ← previous
notes.txt2    ← older
notes.txt3    ← oldest
```

Each run increments the highest existing version number. Nothing is ever overwritten.

## Requirements

- bash
- nano
- sudo (for writing to protected locations)# append

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
