---
name: "0-parallel-codex"
description: "Use when coordinating Codex across branches or git worktrees."
---

# Parallel Codex

Use this skill when the user mentions multiple Codex terminals, worktrees, parallel branches, or shorthand like `branch <name>`.

## Shorthand

- `branch <name>`: work on that branch. Prefer an existing literal branch; otherwise map `<name>` to `codex/<name>`.
- `branch main`: coordinator mode. Review, compare, and merge completed branches one at a time.

## Always Check

Before editing or merging:

1. Run `git status --short --branch`.
2. Run `git worktree list`.
3. Confirm the current worktree matches the requested branch.
4. If the current worktree is wrong, find the matching worktree path and stop for confirmation before editing.

## Work Branch Mode

- Use `$0-ship-task` for implementation.
- Keep edits scoped to the assigned task and branch.
- Do not merge, rebase, force-push, delete worktrees, or edit other branches unless explicitly asked.
- Commit only when asked, using `$0-commit-message`.

## Main Branch Mode

- Act as coordinator/reviewer by default.
- Inspect worktrees, branches, diffs, and test status.
- Recommend merge order and conflict risks.
- Merge one branch at a time only after user approval.
- After each merge, run relevant verification before the next merge.
