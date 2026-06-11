# Ticket Workflow

## Purpose

Normal daily work loop for real bugs/features.

## Inputs

```txt
Project domain/folder name
Project path
Mode or phase, if applicable
Optional previous project name
Optional known surfaces
```

## Workflow

```txt
ticket/plain issue
→ triage
→ project-canon grounding
→ code/runtime investigation
→ minimal implementation
→ appropriate verification
→ project-canon update if durable truth changed
→ .ai update only if workflow memory changed
→ .ai/state cleanup
→ final report
```

## Required Behavior

- Treat ticket/plain issue as work intent, not full truth.
- Read relevant `project-canon/`.
- Treat `project-canon/` as authoritative but correctable.
- Triage before coding unless implementation is explicitly approved.
- Do not patch symptoms.
- Do not silently broaden scope.
- Use appropriate verification, not E2E by default.
- Update `project-canon/` only when durable truth changed.
- When work touches an area represented in `project-canon/`, validate canon against current code/tests/runtime evidence.
- If canon is stale, update it as part of the task.
- If canon and code disagree and the correct truth is unclear, report the conflict before implementation.
- Clean `.ai/state/` at closeout.
- Do not create random markdown reports.

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

A verified task result with clear report.

This skill is the normal real-work loop after project baseline readiness is already established.

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
