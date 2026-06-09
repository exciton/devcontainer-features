#!/bin/sh
set -e

mkdir -p /mnt/claude-dir
chown "${_REMOTE_USER}:${_REMOTE_USER}" /mnt/claude-dir
#This is required for the postCreateCommand to work properly, as it needs to create a directory in the user's home directory.
#When claude-code fixes the hard-coded plugin paths bug, we can remove this and the postCreateCommand.
chown "${_REMOTE_USER}:${_REMOTE_USER}" /home
chmod 0755 /mnt/claude-dir

mkdir -p /usr/local/share/claude-code-config-bind-mount
cp "$(dirname "$0")/onCreate.sh" /usr/local/share/claude-code-config-bind-mount/onCreate.sh
chmod +x /usr/local/share/claude-code-config-bind-mount/onCreate.sh
