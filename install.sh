#!/bin/bash

TOOL_SRC="$(dirname "$0")/rotate"

# --- Check source script exists ---
if [ ! -f "$TOOL_SRC" ]; then
    echo "Error: 'rotate' script not found in $(dirname "$0")"
    exit 1
fi

clear
echo "┌─────────────────────────────────────┐"
echo "│        rotate — install tool        │"
echo "└─────────────────────────────────────┘"
echo ""
echo "  What would you like to call this tool?"
echo ""
echo "  1)  rotate   (recommended)"
echo "  2)  append"
echo "  3)  custom name"
echo ""
read -rp "  Choose [1/2/3]: " choice

case "$choice" in
    1|"")
        TOOL_NAME="rotate"
        ;;
    2)
        TOOL_NAME="append"
        ;;
    3)
        echo ""
        read -rp "  Enter custom name: " TOOL_NAME
        TOOL_NAME="$(echo "$TOOL_NAME" | tr -d '[:space:]')"
        if [ -z "$TOOL_NAME" ]; then
            echo "  No name entered. Aborted."
            exit 1
        fi
        ;;
    *)
        echo "  Invalid choice. Aborted."
        exit 1
        ;;
esac

DEST="/usr/local/bin/$TOOL_NAME"

echo ""
echo "  Installing as: $DEST"
echo ""

# --- Warn if name already exists ---
if [ -f "$DEST" ]; then
    read -rp "  '$DEST' already exists. Overwrite? [y/N]: " overwrite
    case "$overwrite" in
        [yY][eE][sS]|[yY]) ;;
        *)
            echo "  Aborted."
            exit 0
            ;;
    esac
fi

# Use sudo only if not already root
if [ "$(id -u)" -eq 0 ]; then
    cp "$TOOL_SRC" "$DEST" && chmod +x "$DEST"
else
    sudo cp "$TOOL_SRC" "$DEST" && sudo chmod +x "$DEST"
fi

if [ $? -eq 0 ]; then
    echo "  ✓ Installed. Run it with:  $TOOL_NAME <filename>"
else
    echo "  ✗ Install failed. Try running as root: sudo ./install.sh"
    exit 1
fi
echo ""
