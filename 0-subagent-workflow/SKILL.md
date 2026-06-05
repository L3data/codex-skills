---
name: "0-subagent-workflow"
description: "Use for read-only subagent exploration and review."
---

# Subagent Workflow

Use subagents to reduce hallucination and keep main context clean.

Spawn read-only subagents when the task is broad, uncertain, or cross-file:

1. **Searcher**: find relevant files, symbols, call sites, and existing patterns.
2. **Skeptic**: identify edge cases, risky assumptions, bugs, and behavior regressions.
3. **Verifier**: find tests, fixtures, commands, and the smallest validation path.

Cost control:

- Searcher: force low reasoning; do not inherit the main thread model/reasoning.
- Verifier: force low reasoning; do not inherit the main thread model/reasoning.
- Skeptic: force medium reasoning; do not inherit xhigh from the main thread.
- If the subagent tool cannot choose a cheaper reasoning level, do not spawn a read-only subagent for simple search; use local tools in the main thread.
- Use high/xhigh subagents only when explicitly asked or needed for deep architecture reasoning.

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
