# devcontainer-features

## `claude-code-config-bind-mount`

### What it does and why

This feature ensures that Claude Code inside a devcontainer reads and writes its configuration from the host machine's `~/.claude` directory (and `~/.claude.json`), regardless of what username is used inside the container.

It does NOT install Claude Code - use
the official feature for that.

**The problem it solves:** Claude Code stores plugin and extension paths as absolute paths. When the host username differs from the container username, the home directory path changes (e.g. `/home/alice` vs `/home/node`), and any absolute paths persisted in config don't resolve inside the container.

**How it works:**

1. The feature automatically bind-mounts `~/.claude` from the host to `/mnt/claude-dir` inside the container, so the same config is shared, and bind-mounts
   `~/.claude.json` from the host to `/mnt/claude-json`.
2. A symlink is created at `{$localEnv:HOME}/.claude -> /mnt/claude-dir` at container create time, so absolute paths stored by Claude Code resolve correctly even when the host and container usernames differ. This is needed until this issue is resolved: https://github.com/anthropics/claude-code/issues/31388
3. The install script creates `/mnt/claude-dir` as an empty directory owned by the container user, so Claude Code starts fresh with no error if the host `~/.claude` directory doesn't exist yet.

### Usage

Add the feature to your `devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/exciton/devcontainer-features/claude-code-config-bind-mount:1": {}
  }
}
```

The bind mount is configured automatically by the feature — no `mounts` entry is needed.

### If the host `~/.claude` directory does not exist

`/mnt/claude-dir` will exist as an empty directory inside the container and Claude Code will start fresh with no persisted config. No error will occur — Claude Code will simply behave as if it has never been configured.

### Similar features

- [ghcr.io/esimkowitz/devcontainer-features/claude-code-persistence](https://github.com/esimkowitz/devcontainer-features/tree/main/src/claude-code-persistence) : Mounts a shared volume across multiple devcontainers. Does not fix plugin paths.
- [ghcr.io/sliekens/devcontainer-features/claude](https://github.com/sliekens/devcontainer-features/tree/main/src/claude) : Bind mounts (like this feature), but also installs Claude Code directly, and doesn't fix the plugin paths.
