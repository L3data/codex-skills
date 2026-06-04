# Codex Skills

Small, focused Codex skills for a lean coding workflow:

- structure rough tasks before editing
- use read-only subagents for noisy exploration
- keep commit messages consistent

## Skills

- `commit-message`: enforces the `Add`, `Fix`, `Update`, `Remove`, `Refactor`, `Test`, `Docs`, `Chore`, and `Revert` subject schema.
- `ship-task`: a lightweight GSD-style loop: brief, explore, plan, build, verify, close.
- `subagent-workflow`: runs read-only Searcher, Skeptic, and Verifier subagents, then lets the main agent implement.

## Install

Install a skill by copying its folder into your Codex skills directory:

```bash
cp -r commit-message ~/.codex/skills/
cp -r ship-task ~/.codex/skills/
cp -r subagent-workflow ~/.codex/skills/
```

Or install one from GitHub with Codex:

```text
$skill-installer https://github.com/L3data/codex-skills/tree/main/ship-task
```

Restart Codex after installing or updating skills.

## Workflow

```text
$ship-task <rough task>
$subagent-workflow analyze the task before implementing
$commit-message draft a commit message for staged changes
```

Use `ship-task` as the default operating loop, `subagent-workflow` when the task is broad or uncertain, and `commit-message` when drafting or creating commits.

## License

MIT License. See `LICENSE`.
