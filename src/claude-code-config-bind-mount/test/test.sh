#!/bin/bash
set -e

echo "Test: /mnt/claude-dir exists as a directory"
if [ ! -d /mnt/claude-dir ]; then
    echo "FAIL: /mnt/claude-dir is not a directory"
    exit 1
fi
echo "PASS"

