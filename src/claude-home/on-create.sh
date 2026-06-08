#!/bin/sh
set -e

ln -sfn /opt/claude-home ${_REMOTE_USER_HOME:-$HOME}/.claude
ln -sfn /opt/claude-json ${_REMOTE_USER_HOME:-$HOME}/.claude.json

echo "claude-home: symlinked ${_REMOTE_USER_HOME:-$HOME}/.claude -> /opt/claude-home"
echo "claude-home: symlinked ${_REMOTE_USER_HOME:-$HOME}/.claude.json -> /opt/claude-json"
