# devcontainer-features

## `claude-home`

### What it does and why

This feature ensures that Claude Code inside a devcontainer reads and writes its configuration from the host machine's `~/.claude` directory, regardless of what username is used inside the container.

**The problem it solves:** Claude Code stores plugin and extension paths as absolute paths. When the host username differs from the container username, the home directory path changes (e.g. `/home/alice` vs `/home/node`), and any absolute paths persisted in config don't resolve inside the container.

**How it works:**

1. The feature sets `CLAUDE_CONFIG_DIR=/opt/claude-home` so Claude Code always looks for config in that fixed path.
2. The feature automatically bind-mounts `~/.claude` from the host to `/opt/claude-home` inside the container, so the same config is shared.
3. A symlink is created at `$HOST_HOME/.claude -> /opt/claude-home` at container create time, so absolute paths stored by Claude Code resolve correctly even when the host and container usernames differ.
4. The install script creates `/opt/claude-home` as an empty directory owned by the container user, so Claude Code starts fresh with no error if the host `~/.claude` directory doesn't exist yet.

### Usage

Add the feature to your `devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/OWNER/devcontainer-features/claude-home:1": {}
  }
}
```

> **Note:** Replace `OWNER` with your GitHub username.

The bind mount is configured automatically by the feature — no `mounts` entry is needed.

### If the host `~/.claude` directory does not exist

`/opt/claude-home` will exist as an empty directory inside the container and Claude Code will start fresh with no persisted config. No error will occur — Claude Code will simply behave as if it has never been configured.
