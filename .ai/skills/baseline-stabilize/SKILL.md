# Baseline Stabilize

## Purpose

Review the accumulated onboarding/canon/cleanup/guardrail changes before real work starts.

## Inputs

```txt
Project domain/folder name
Project path
Mode or phase, if applicable
Optional previous project name
Optional known surfaces
```

## Scope

Check:

```txt
git status
git diff --stat
forbidden folders absent
project-canon exists
AGENTS.md correct
.ai-project.md correct
.ai-local regenerated
stale reference sweeps clean
targeted checks if tooling changed
```

Also confirm:

```txt
the adopted project appears in .ai/workspace/project-index.local.md when that file exists
.ai/workspace/project-index.local.md is gitignored
no real project names were added to .ai/workspace/project-index.example.md
```

## Workflow

1. Review all dirty changes and classify them.
2. Confirm forbidden folders are absent.
3. Confirm project canon and entry files are coherent.
4. Confirm the local project index reflects the adopted project when the local index exists.
5. Confirm root `docs/` is absent unless explicitly approved.
6. Confirm `docs.legacy-review/` is absent.
7. Run the narrowest relevant checks if tooling/instructions changed.
8. Produce a commit recommendation or readiness verdict.
9. Stop before feature/bug work.

## Must Not Do

- Do not add new product claims.
- Do not perform broad validation.
- Do not start feature/bug work.
- Do not commit unless explicitly asked.

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

Baseline is ready to commit or ready for real ticket work.

Stop after the final report. Do not automatically run `ticket-workflow`.

## Project Index Update

```md
## Project Index Update
Updated: yes/no
File:
Entry:
Gitignored: yes/no
Notes:
```

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
