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

Commit granularity: keep one logical change per commit. Split separable code, docs, config, tests, repo metadata, and tooling changes into separate commits. If nothing is staged and scope is clear, stage only intended files; otherwise ask. Never stage unrelated changes.
