#!/bin/sh
set -e

ln -sfn /mnt/claude-dir ${_REMOTE_USER_HOME:-$HOME}/.claude
ln -sfn /mnt/claude-json ${_REMOTE_USER_HOME:-$HOME}/.claude.json

echo "claude-home: symlinked ${_REMOTE_USER_HOME:-$HOME}/.claude -> /mnt/claude-dir"
echo "claude-home: symlinked ${_REMOTE_USER_HOME:-$HOME}/.claude.json -> /mnt/claude-json"
