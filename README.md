# Codex Skills

Small, focused Codex skills for a lean coding workflow:

- structure rough tasks before editing
- use read-only subagents for noisy exploration
- keep subagents cheaper than the main thread by default
- coordinate parallel Codex worktrees
- keep commit messages consistent

The skill names start with `0-` so they appear early in Codex's `$` skill picker.

## Skills

- `0-commit-message`: enforces the `Add`, `Fix`, `Update`, `Remove`, `Refactor`, `Test`, `Docs`, `Chore`, and `Revert` subject schema.
- `0-ship-task`: a lightweight GSD-style loop: brief, explore, plan, build, verify, close.
- `0-subagent-workflow`: runs read-only Searcher, Skeptic, and Verifier subagents, then lets the main agent implement.
- `0-parallel-codex`: coordinates multiple Codex terminals across branches and git worktrees.

## Install Skills

Install a skill by copying its folder into your Codex skills directory:

```bash
cp -r 0-commit-message ~/.codex/skills/
cp -r 0-ship-task ~/.codex/skills/
cp -r 0-subagent-workflow ~/.codex/skills/
cp -r 0-parallel-codex ~/.codex/skills/
```

Or install one from GitHub with Codex:

```text
$skill-installer https://github.com/L3data/codex-skills/tree/main/0-ship-task
```

Restart Codex after installing or updating skills.

## Optional AGENTS.md

`AGENTS.md` is a compact always-on defaults file. Copy it globally:

```bash
cp AGENTS.md ~/.codex/AGENTS.md
```

Or copy it into a repo root to apply only to that repo. Keep detailed workflows in skills so `AGENTS.md` stays small.

The defaults also tell Codex to keep search/test subagents on low reasoning, risk-review subagents on medium reasoning, and reserve high/xhigh subagents for explicit requests or deep architecture work.

## Workflow

```text
$0-ship-task <rough task>
$0-subagent-workflow analyze the task before implementing
$0-parallel-codex work on this task branch oi
$0-commit-message draft a commit message only
$0-commit-message commit the staged changes
```

Say `draft` when you only want a message. Say `commit` when you want Codex to create the git commit.

Use `0-ship-task` as the default operating loop, `0-subagent-workflow` when the task is broad or uncertain, `0-parallel-codex` for multi-terminal branch coordination, and `0-commit-message` when drafting or creating commits.

## License

MIT License. See `LICENSE`.
