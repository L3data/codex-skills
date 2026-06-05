# Personal Codex Defaults

- Keep changes scoped and prefer existing repo patterns.
- If the task is vague, restate goal, constraints, acceptance criteria, and blockers before editing.
- Main thread owns code edits, verification, and closeout.
- Use subagents only for read-only search, pattern inspection, risk review, and test discovery; require concise `file:line` evidence, confidence, unknowns, and next action.
- Force cheaper read-only subagents than the main thread: low reasoning for search/test discovery, medium for risk review. Do not let subagents inherit xhigh; use high/xhigh only when explicitly asked or needed for deep architecture reasoning.
- Let subagents edit only when explicitly assigned isolated branches, worktrees, or non-overlapping file scopes.
- For multiple Codex terminals, use one git worktree and branch per terminal; never use `git switch` in a shared folder. `branch <name>` means work branch, `branch main` means coordinator/review mode.
- Before branch-sensitive work, check `git status --short --branch` and `git worktree list`.
- Do not commit, merge, rebase, force-push, delete worktrees, or stage unrelated changes unless explicitly asked.
- Commit subjects use `Add/Fix/Update/Remove/Refactor/Test/Docs/Chore/Revert <thing>`; no Conventional Commits.
