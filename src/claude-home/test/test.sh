#!/bin/bash
set -e

echo "Test: /opt/claude-home exists as a directory"
if [ ! -d /opt/claude-home ]; then
    echo "FAIL: /opt/claude-home is not a directory"
    exit 1
fi
echo "PASS"

echo "Test: CLAUDE_CONFIG_DIR equals /opt/claude-home"
if [ "$CLAUDE_CONFIG_DIR" != "/opt/claude-home" ]; then
    echo "FAIL: CLAUDE_CONFIG_DIR is '${CLAUDE_CONFIG_DIR}', expected '/opt/claude-home'"
    exit 1
fi
echo "PASS"
