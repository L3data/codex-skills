---
name: 0-bash
description: Bundle commands that Codex cannot execute because they require sudo, elevated permissions, or manual user execution into a single temporary Bash script. Use before a task to collect future blocked commands, or after Codex has already emitted manual command spam to convert it into one runnable script.
---

# Bundle Manual Commands

Keep working on every safe, executable part of the task. Collect only commands that the user must run, and hand back one temporary Bash script instead of a series of command snippets.

## Build the script

1. Identify commands that cannot run in the current environment because they need elevation, unavailable access, or direct user execution.
2. Resolve exact targets and dependencies with read-only checks first. Do not use the script to bypass an approval that Codex can request normally.
3. Create one uniquely named file under `${TMPDIR:-/tmp}`. Reuse that file for the rest of the task.
4. Start it with:

   ```bash
   #!/usr/bin/env bash
   set -euo pipefail
   ```

5. Append commands in dependency order. Add brief comments explaining purpose, required working directory, and any step that may prompt.
6. Quote paths and variables. Use `sudo` only on the individual commands that require it; do not require the whole script to run as root.
7. Make the script executable and syntax-check it with `bash -n`.

Continue adding newly discovered manual commands to the same script. If one must run before Codex can proceed, report that dependency promptly; otherwise defer the handoff until the task is complete.

## Consolidate earlier commands

When manual commands have already been emitted, reconstruct them into one script in the order they must run. Remove duplicates and superseded alternatives. Preserve relevant flags and working-directory changes, and call out any ambiguity instead of guessing.

## Safety

- Never embed secrets, tokens, passwords, or private key material. Read them from environment variables or prompt at runtime without echoing.
- Do not include destructive commands until their targets are exact and clearly authorized.
- Do not widen the user's requested scope merely because execution is deferred to them.
- Prefer idempotent checks when a command may be rerun.
- Do not create an empty script when there are no manual commands.

## Handoff

Return the script path, a one-line summary of what it does, and one command that runs it. Do not repeat every bundled command in the response. State whether running it is required to finish the current task and whether Codex needs its output afterward.
