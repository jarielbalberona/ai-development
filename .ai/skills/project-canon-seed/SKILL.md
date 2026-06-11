# Project Canon Seed

## Purpose

Create the first useful `project-canon/` baseline from light repo inspection.

## Inputs

```txt
Project domain/folder name
Project path
Mode or phase, if applicable
Optional previous project name
Optional known surfaces
```

## Scope

Inspect only high-signal files/folders:

```txt
README.md
package.json
pnpm-workspace.yaml
turbo.json
apps/
packages/
config files
existing obvious docs
```

Populate or update:

```txt
project-canon/README.md
project-canon/product/overview.md
project-canon/product/workflows.md
project-canon/product/user-roles.md
project-canon/architecture/overview.md
project-canon/architecture/frontend.md
project-canon/architecture/backend.md
project-canon/architecture/database.md
project-canon/architecture/integrations.md
project-canon/domain/entities.md
project-canon/domain/business-rules.md
project-canon/domain/permissions.md
project-canon/operations/environments.md
project-canon/operations/deployment.md
project-canon/operations/troubleshooting.md
project-canon/decisions/README.md
project-canon/changelog/README.md
```

## Required Style

- Concise.
- Curated.
- Honest about unknowns.
- Use `Status: unknown / to be confirmed` when not verified.
- Do not invent facts.
- If migrated from old docs, mark validation status.

## Workflow

1. Read the project entry files and current `project-canon/README.md`.
2. Inspect only high-signal repo files and folder names.
3. Populate the canon baseline with current, bounded, durable truth.
4. Mark unknowns explicitly instead of guessing.
5. If any statement comes from old docs, mark it as migrated and needing validation.
6. Stop before deep architecture assessment or cleanup.

## Must Not Do

- Do not perform full architecture audit.
- Do not delete stale files.
- Do not dump old docs wholesale into canon.

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

`project-canon/` is usable as a baseline but explicitly not fully validated.

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
