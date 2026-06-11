# Legacy Artifact Audit

## Purpose

Inventory and classify stale AI/task/docs artifacts before deleting anything.

This is assessment-only unless explicitly instructed otherwise.

## Inputs

```txt
Project domain/folder name
Project path
Mode or phase, if applicable
Optional previous project name
Optional known surfaces
```

## Candidate Locations

Inspect if present:

```txt
docs/
docs.legacy-review/
.ai/
.agent/
.codex/
initiatives/
reports/
archive/
task-notes/
plans/
handoffs/
old markdown files
old task reports
old assessment files
```

## Classification Buckets

Use:

```txt
KEEP_CURRENT
PROMOTE_TO_PROJECT_CANON
PROMOTE_TO_WORKSPACE_AI
DELETE_STALE
DELETE_NOISE
REVIEW
```

## Durable Project Truth

Promote only if it contains:

```txt
product behavior
workflows
user roles
permissions
domain rules
architecture
API contracts
DB ownership/scoping
deployment/runtime behavior
integrations
mobile/offline-first behavior
verification expectations
ADR-level decisions
```

## Non-Durable / Noisy Content

Usually delete later:

```txt
completed initiative notes
old task reports
implementation transcripts
handoff prompts
scratch/debug notes
generated logs
stale plans
duplicated docs already captured in project-canon/
```

## Workflow

1. Inventory likely stale folders and markdown/text artifacts.
2. Read only enough to classify safely.
3. Separate durable project truth from workflow truth and from noise.
4. Keep the review list small and justified.
5. Produce a cleanup plan. Do not delete by default.

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

A cleanup plan. No deletion by default.

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
