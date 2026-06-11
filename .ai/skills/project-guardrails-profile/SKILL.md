# Project Guardrails Profile

## Purpose

Define project-specific guardrails and verification profile.

## Inputs

```txt
Project domain/folder name
Project path
Mode or phase, if applicable
Optional previous project name
Optional known surfaces
```

## Scope

Create or update:

```txt
project-canon/operations/agent-guardrails.md
project-canon/operations/verification-profile.md
```

Create domain-specific verification docs when needed, for example:

```txt
project-canon/operations/mobile-verification.md
project-canon/architecture/offline-first.md
project-canon/architecture/mobile.md
project-canon/domain/mobile-pos-rules.md
```

## Required Guardrail Themes

Use only what applies to the project:

```txt
tenant/user/data isolation
auth/permission boundaries
backend-owned business truth
frontend/server-state boundaries
database ownership/scoping
integration contracts
critical workflow rules
mobile/offline-first proof boundaries
device/printer/runtime proof boundaries
no random markdown
no fake PASS
E2E is escalation, not default
```

## Verification Rule

Must include:

```txt
Appropriate verification is default.
E2E is escalation, not default.
Use the narrowest reliable proof based on failure boundary and risk.
Do not stop at typecheck for behavioral issues.
```

## Workflow

1. Read the current project canon baseline.
2. Identify the project-specific safety boundaries that future tickets must not violate.
3. Define verification expectations by task type and failure boundary.
4. Add only high-confidence, project-relevant guardrails.
5. Stop before broad runtime validation.

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

Future tickets have project-specific safety rails and verification rules.

Stop after the final report. Do not automatically run `baseline-stabilize`.

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
