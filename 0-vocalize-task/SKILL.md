---
name: "0-vocalize-task"
description: "Use to turn rough thoughts into a clear coding task prompt."
---

# Vocalize Task

Use when the user is thinking out loud, unsure how to phrase a task, or wants help turning intent into a prompt.

Do not edit files, run tests, or implement.

Output:
- Goal: one sentence.
- Context: relevant facts from the user.
- Non-goals: what not to do.
- Constraints: branches, files, APIs, compatibility, style, or performance limits.
- Acceptance criteria: observable outcomes.
- Unknowns: blockers only.
- Ready prompt: concise prompt the user can send with `$0-ship-task`, plus `$0-subagent-workflow` or `$0-commit-message` only when useful.

Rules:
- Preserve the user's intent and wording.
- Do not invent requirements; mark assumptions.
- Ask at most 2 blocking questions.
- If enough information exists, produce the ready prompt instead of asking questions.
