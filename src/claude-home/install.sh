#!/bin/sh
set -e

mkdir -p /opt/claude-home
chown "${_REMOTE_USER}:${_REMOTE_USER}" /opt/claude-home
chown "${_REMOTE_USER}:${_REMOTE_USER}" /home
chmod 0755 /opt/claude-home

mkdir -p /usr/local/lib/claude-home
cp "$(dirname "$0")/on-create.sh" /usr/local/lib/claude-home/on-create.sh
chmod +x /usr/local/lib/claude-home/on-create.sh
