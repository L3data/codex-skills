---
name: "0-ship-task"
description: "Use for structured end-to-end coding tasks."
---

# Ship Task

Use this GSD-lite loop for non-trivial coding tasks:

1. **Brief**: Restate the goal, constraints, likely files, acceptance criteria, and blockers. Ask only blocking questions.
2. **Explore**: Inspect the repo first. For broad or uncertain tasks, spawn read-only subagents for search, risk review, or test discovery; return summaries only.
3. **Plan**: Give a short implementation plan when the approach is not obvious or the task spans multiple files.
4. **Build**: Keep edits scoped. Main agent owns final code changes unless work is safely isolated.
5. **Verify**: Run the smallest meaningful tests/checks. If they cannot run, say why.
6. **Close**: Summarize changed files, behavior, verification, and any remaining risk.

Defaults:

- Do not commit unless explicitly asked.
- Avoid unrelated refactors and dependency changes.
- Prefer existing repo patterns over new abstractions.
- Keep main context clean; do not paste noisy logs unless they matter.
- Use `$0-commit-message` when committing.
