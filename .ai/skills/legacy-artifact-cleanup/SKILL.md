# Legacy Artifact Cleanup

## Purpose

Execute the cleanup plan from `legacy-artifact-audit`.

## Inputs

```txt
Project domain/folder name
Project path
Mode or phase, if applicable
Optional previous project name
Optional known surfaces
```

## Scope

- Promote durable truth into `project-canon/`.
- Promote reusable workflow truth into parent `.ai/core/` or `.ai/workspace/`.
- Delete stale/noisy files.
- Remove empty stale folders.
- Verify no stale references remain.

## Must Not Delete

```txt
project-canon/
.ai-local/
AGENTS.md
.ai-project.md
active app/package README files
active app/package docs
application-owned package report folders unless proven stale
```

## Must Delete When Safe

```txt
project-local .ai/
project-local .agent/
project-local .codex/
docs/
docs.legacy-review/
initiatives/
reports/
archive/
task-notes/
plans/
handoffs/
```

## Workflow

1. Start from the audit classification, not from guesswork.
2. Promote only the durable slice of any stale artifact.
3. Delete stale/noisy artifacts aggressively once truth is promoted or confirmed absent.
4. Remove empty directories.
5. Sweep references so no active instructions/tooling still point to removed folders/files.

## Must Not Do

- Do not modify application behavior.
- Do not dump old files wholesale into `project-canon/`.
- Do not create a new permanent quarantine folder unless explicitly approved.
- Do not commit.

## Constraints

```txt
Do not create CLAUDE.md.
Do not create project-local .ai/.
Do not create project-local .agent/.
Do not create project-local .codex/.
Do not create random markdown.
Do not create reports/plans/handoffs/task-notes folders.
Do not recreate docs/ or docs.legacy-review/ as source-of-truth.
Do not commit unless explicitly asked.
Final reports belong in chat/ticket/PR, not repo markdown.
```

## Final Output

Repo is clean from stale AI/task/docs artifacts.

## Closeout

Report:

```txt
Project Canon Update
AI Memory Update
AI State Cleanup
Markdown File Hygiene
Verification Selection, where applicable
```

Use the shared report format from:

```txt
.ai/core/report-format.md
```
