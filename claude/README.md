# Claude Code

Shared setup for both Claude Code profiles, plus a log of token-saving changes.

| Profile | Command | Config directory |
|---|---|---|
| Main | `claude` | `~/.claude` |
| Personal | `claude-personal` | `~/.claude-personal` |

## What's tracked

| File | Installed to | Purpose |
|---|---|---|
| `hooks/guard-large-reads` | `~/.claude/hooks/` (symlink) | Keeps large files out of the main conversation |
| `agents/bulk-reader.md` | `agents/` in both profiles (symlink) | Cheap read-only agent that answers questions about large files |
| `hooks.json` | Merged into both `settings.json` files | Registers the RTK and large-read hooks |
| `merge-hooks` | Run by `install.sh` | Adds `hooks.json` to a settings file, leaving everything else alone |

`settings.json` itself is deliberately not tracked. Claude Code rewrites it, each profile differs, and it can hold private notes. This repo is public, so never commit one.

New agents and hook changes need a new session to take effect.

## Settings

- **`LARGE_READ_MIN_LINES`:** line count above which full reads are denied (default `350`). Set it in the `env` block of `settings.json`.
- **Turning the guard off:** delete the `Read` entry from `hooks` in that profile's `settings.json`.
- **RTK:** not in the Brewfile, so install it by hand first. The `Bash` hook does nothing useful without it. Then set `exclude_commands = ["grep"]` under `[hooks]` in `~/Library/Application Support/rtk/config.toml`, because that file is not tracked here.
- **Permission rules:** RTK rewrites commands before permission checks (`cat` becomes `rtk read`), so a rule that names a rewritten command needs both forms.

## Token-saving log

### 2026-11-04: large-read guard, `bulk-reader`, RTK on both profiles

Rebuilt natively from the idea behind Spotify's [`shunt`](https://github.com/spotify/portal-ai-plugins/tree/main/plugins/shunt) plugin, which needs a Portal instance.

Verified:

- The guard denies full reads in the main conversation, and subagents can still read the same files.
- `bulk-reader` runs on Haiku and follows references such as locale keys to the real text.
- RTK fires on the personal profile. It rewrites commands without auto-approving them.
- `rtk read` output matched `cat` byte for byte on three files, so it hides no code.

Not verified or measured:

- **Real savings.** Next step: run one task with and without the guard and compare `/cost`.
- Live behaviour on the main profile (same files, settings validated).
- Whether `effort: low` applies to the agent.
- `rtk gain` as a headline number. It reports over 98% saved, but nearly all of that is `rtk read`, which averages about 10% per command, so a few huge reads dominate.

### 2026-11-04: `rtk grep` can give wrong results

RTK rewrites shell `grep` to `rtk grep`, which behaves differently:

- Basic-regex syntax such as `\(a\|b\)` returned `0 matches` where real `grep` found 2, so a real result reads as "not found".
- With extended syntax, matches on lines containing `:` came back garbled (`18:0:{` instead of the matched line).

Claude Code's built-in `Grep` tool is not affected.

Fixed by setting `exclude_commands = ["grep"]` under `[hooks]` in RTK's `config.toml`, which applies to both profiles. Verified: `grep` is no longer rewritten, including after `cd`, and other rewrites still work. `rtk grep` had saved only about 3K tokens in total.

Still open: `rg` is still rewritten to `rtk grep`, so the garbled output may affect it. A grep that reads from a pipe is unaffected, but `cat a.rb | grep foo` still has its `cat` rewritten.

## Open ideas

- `cat` and `sed -n` bypass the guard. Add a `Bash` check only if Claude is seen doing this after a denial.
- Delegating writes to a cheap model was skipped on purpose: no measured savings, and `shunt`'s writer never sees the code under test.
- Model, effort and compaction settings are probably bigger levers than read guards, but are untested.
- RTK telemetry is on. It can be disabled under `[telemetry]` in RTK's `config.toml`.
