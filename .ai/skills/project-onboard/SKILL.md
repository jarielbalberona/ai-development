# Project Onboard

## Purpose

Attach an existing repo under `projects/<domain>/` to the `ai-development` workspace.

This is structural onboarding only.

## Inputs

```txt
Project domain/folder name
Project path
Mode or phase, if applicable
Optional previous project name
Optional known surfaces
```

## Scope

Create or repair:

```txt
projects/<domain>/AGENTS.md
projects/<domain>/.ai-project.md
projects/<domain>/.ai-local/core-snapshot.md
projects/<domain>/project-canon/ skeleton
```

Update:

```txt
.ai/workspace/project-index.local.md when present, otherwise use .ai/workspace/project-index.example.md as the format reference
```

Project onboarding must create or update `.ai/workspace/project-index.local.md`.

The entry must include:

- project name/domain
- path
- status
- previous name if provided
- default verification mode
- project-canon README path
- short notes

`project-index.example.md` is only the committed template and must not contain real project names.

## Workflow

1. Confirm the target repo exists under `projects/<domain>/`.
2. Verify the repo has `.git/` and is a real project checkout.
3. Create or repair the project entrypoint files and `project-canon/` skeleton.
4. Ensure the project entry files point to parent `.ai/core/` rules and `project-canon/`.
5. Regenerate `.ai-local/core-snapshot.md` from the shared parent `.ai/`.
6. Update `.ai/workspace/project-index.local.md` for local/private routing when it exists.
7. If `.ai/workspace/project-index.local.md` does not exist, create it from `.ai/workspace/project-index.example.md` and add the adopted project entry.
8. Never place real project names into `.ai/workspace/project-index.example.md`.
7. Stop. Do not seed deep project truth yet.

## Must Not Do

- Do not deeply document the project.
- Do not seed full canon.
- Do not audit/delete legacy artifacts.
- Do not normalize root-level `docs/` as an accepted final state.
- Do not define project guardrails.
- Do not start ticket work.
- Do not delete old docs/artifacts.
- Do not modify application code.
- Do not run app tests.
- Do not create `CLAUDE.md`.
- Do not create project-local `.ai/`, `.agent/`, or `.codex/`.

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

The project is structurally onboarded and ready for `project-canon-seed`.

Any existing root-level `docs/` remains legacy until later audit/cleanup. Structural onboarding must not treat it as current canonical documentation by default.

Stop after the final report. Do not automatically run `project-canon-seed`.

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
