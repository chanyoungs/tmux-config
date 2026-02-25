#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME/.tmux.conf"
SOURCE="$SCRIPT_DIR/.tmux.conf"

if [ -L "$TARGET" ]; then
    echo "Symlink already exists at $TARGET"
elif [ -f "$TARGET" ]; then
    echo "Backing up existing $TARGET to $TARGET.bak"
    mv "$TARGET" "$TARGET.bak"
fi

ln -sf "$SOURCE" "$TARGET"
echo "Symlink created: $TARGET -> $SOURCE"
