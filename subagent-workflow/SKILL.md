---
name: subagent-workflow
description: "Use for read-only subagent exploration and review."
---

# Subagent Workflow

Use subagents to reduce hallucination and keep main context clean.

Spawn read-only subagents when the task is broad, uncertain, or cross-file:

1. **Searcher**: find relevant files, symbols, call sites, and existing patterns.
2. **Skeptic**: identify edge cases, risky assumptions, bugs, and behavior regressions.
3. **Verifier**: find tests, fixtures, commands, and the smallest validation path.

Each subagent returns only:

- conclusion
- `file:line` evidence
- confidence level
- unknowns
- recommended next action

Rules:

- Subagents do not edit files.
- Do not return raw logs unless essential.
- Wait for all summaries before implementing.
- Main agent cross-checks important claims against source files before editing.
- Main agent owns final edits, verification, and closeout.
