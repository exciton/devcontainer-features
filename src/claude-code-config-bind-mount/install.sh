#!/bin/sh
set -e

mkdir -p /mnt/claude-dir
chown "${_REMOTE_USER}:${_REMOTE_USER}" /mnt/claude-dir
chmod 0755 /mnt/claude-dir

FEATURE_DIR="/usr/local/share/claude-code-config-bind-mount"
mkdir -p "$FEATURE_DIR"
cp "$(dirname "$0")/onCreate.sh" "$FEATURE_DIR/onCreate.sh"
chmod +x "$FEATURE_DIR/onCreate.sh"

#This is required for the postCreateCommand to work properly, as it needs to create a directory in the user's home directory.
#When claude-code fixes the hard-coded plugin paths bug, we can remove this and the postCreateCommand.
chown "${_REMOTE_USER}:${_REMOTE_USER}" /home

echo "Claude Code Config Bind Mount feature installed."
