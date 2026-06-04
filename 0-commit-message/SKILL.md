---
name: "0-commit-message"
description: "Use for git commit messages."
---

# Commit Message

Use this schema for commit subjects:

- `Add <thing>`: new feature, file, API, UI, behavior, or test coverage.
- `Fix <thing>`: broken behavior, regression, failing test, or incorrect output.
- `Update <thing>`: change existing behavior, config, copy, dependency, styling, or implementation.
- `Remove <thing>`: delete unused behavior, files, flags, dependencies, or config.
- `Refactor <thing>`: internal change with no intended behavior change.
- `Test <thing>`: test-only change.
- `Docs <thing>`: documentation-only change.
- `Chore <thing>`: tooling, build, formatting, generated files, repo maintenance, or CI.
- `Revert <thing>`: roll back a previous change.

Rules: no Conventional Commits syntax, no trailing period, prefer user-visible outcome, and keep the subject under 72 characters when practical.

Behavior: if the user asks to draft, suggest, review, or improve a message, do not commit. If this skill is invoked with an implementation task, treat it as atomic commit mode: after verification, stage intended changes and create commits. If the user explicitly says not to commit, do not commit.

Before committing:

- Inspect `git status --short`, `git diff --name-only`, and staged diff if any.
- Decide commit groups before staging.
- State the planned commit list before the first commit.
- If 5+ files or multiple domains changed, pause after listing proposed commits and proceed only if the user does not object.

Default split policy:

- Runtime behavior changes: separate commit per independently reviewable behavior.
- Shared helpers/refactors: separate commit.
- Tests: separate commit unless they are direct coverage for a small fix.
- Docs: separate commit.
- Config, tooling, generated files, and repo metadata: separate commit.
- Do not combine docs, tests, config, and runtime code in one commit unless explicitly asked.
- If multiple logical changes exist, split them. If unsure, prefer more small commits.

Never stage unrelated changes.
