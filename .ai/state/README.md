# AI State

`.ai/state/` is for active task working memory only.

It may contain temporary triage notes, current-task notes, or short-lived investigation state.

Rules:

- It must be cleaned at the end of a task.
- Durable project truth must be moved to `project-canon/`.
- Reusable workflow learning must be moved to `.ai/core/` or `.ai/workspace/`.
- Temporary notes must be deleted.
- No raw logs, transcripts, generated noise, or stale task reports should remain.

`.ai/state/` is not a dumping ground for task reports.

Temporary `.md` files may exist only during active investigation. At closeout,
they must be deleted unless their content is promoted into `project-canon/` or
`.ai/core/` / `.ai/workspace/`.
