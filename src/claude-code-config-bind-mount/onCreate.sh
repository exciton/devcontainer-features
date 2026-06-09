#!/bin/sh
set -e

ln -sfn /mnt/claude-dir ${_REMOTE_USER_HOME:-$HOME}/.claude
ln -sfn /mnt/claude-json ${_REMOTE_USER_HOME:-$HOME}/.claude.json

echo "Claude Code Config Bind Mount: symlinked ${_REMOTE_USER_HOME:-$HOME}/.claude -> /mnt/claude-dir"
echo "Claude Code Config Bind Mount: symlinked ${_REMOTE_USER_HOME:-$HOME}/.claude.json -> /mnt/claude-json"
