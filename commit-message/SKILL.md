---
name: commit-message
description: "Use when drafting, reviewing, validating, or creating git commit messages."
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

Rules: no Conventional Commits syntax, no trailing period, prefer user-visible outcome, and keep the subject under 72 characters when practical. If committing, inspect staged changes and recent commit style first; never stage unrelated changes.
