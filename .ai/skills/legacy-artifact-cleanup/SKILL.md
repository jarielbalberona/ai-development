# Legacy Artifact Cleanup

## Purpose

Execute the cleanup plan from `legacy-artifact-audit`.

Destructive cleanup is allowed only when this skill is explicitly invoked.

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
3. Treat root-level `docs/` as legacy by default. Do not preserve it as a normal final state unless the user explicitly approves it.
4. Move root `docs/` content to app/package-local docs only when ownership is obvious.
5. Delete stale/noisy artifacts aggressively once truth is promoted or confirmed absent.
6. Remove empty directories.
7. Sweep references so no active instructions/tooling still point to removed folders/files.
8. Do not preserve root `docs/` as a normal final state.
9. Do not move root docs into a quarantine folder.

## Final-State Checks

- root-level `docs/` does not exist unless explicitly approved by the user
- no permanent quarantine folder is left behind unless explicitly approved

## Must Not Do

- Do not modify application behavior.
- Do not dump old files wholesale into `project-canon/`.
- Do not create a new quarantine folder unless the user explicitly asks for a temporary backup.
- Do not commit.

## Constraints

```txt
Do not create CLAUDE.md.
Do not create project-local .ai/.
Do not create project-local .agent/.
Do not create project-local .codex/.
Do not create random markdown.
Do not create reports/plans/handoffs/task-notes folders.
Do not create docs quarantine folders.
Do not commit unless explicitly asked.
Final reports belong in chat/ticket/PR, not repo markdown.
```

## Final Output

Repo is clean from stale AI/task/docs artifacts.

Stop after the final report. Do not automatically run `project-guardrails-profile`.

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
