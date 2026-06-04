---
name: "0-parallel-codex"
description: "Use when coordinating Codex across branches or git worktrees."
---

# Parallel Codex

Use this skill when the user mentions multiple Codex terminals, worktrees, parallel branches, or shorthand like `branch <name>`.

## Shorthand

- `branch <name>`: work on that branch. Prefer an existing literal branch; otherwise map `<name>` to `codex/<name>`.
- `branch main`: coordinator mode. Review, compare, and merge completed branches one at a time.
- In multi-terminal work, never use `git switch` to change the shared folder's branch. Use a separate worktree instead.

## Always Check

Before editing or merging:

1. Run `git status --short --branch`.
2. Run `git worktree list`.
3. Confirm the current worktree matches the requested branch.
4. If the current worktree is wrong, find the matching worktree path and stop for confirmation before editing.
5. If no matching worktree exists, propose `git worktree add <unique-path> -b <unique-branch> HEAD`; do not run `git switch`.

## Worktree Setup

- Create one unique worktree path and one unique branch per Codex terminal.
- If the original folder has uncommitted changes, stop before creating/switching worktrees and ask which agent owns those edits.
- After creating a worktree, continue only in that worktree folder.
- Do not edit, stage, or commit from the original shared folder unless it is the assigned worktree.

## Work Branch Mode

- Use `$0-ship-task` for implementation.
- Keep edits scoped to the assigned task and branch.
- Do not run `git switch`, merge, rebase, force-push, delete worktrees, or edit other branches unless explicitly asked.
- Commit only when asked, using `$0-commit-message`.

## Main Branch Mode

- Act as coordinator/reviewer by default.
- Inspect worktrees, branches, diffs, and test status.
- Recommend merge order and conflict risks.
- Merge one branch at a time only after user approval.
- After each merge, run relevant verification before the next merge.
