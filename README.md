# AI Development Workspace

## What this is

This repository contains the shared AI-assisted development operating system used to onboard and work on existing software projects.

It is built around:

`Ticket-First, Docs-Grounded, Local-Verified Closed Loop`

- Ticket-First: work starts from a ticket or pasted issue.
- Docs-Grounded: agents ground work in each project's `project-canon/`.
- Local-Verified: agents verify using the narrowest reliable local/runtime proof.
- Closed Loop: triage, implement, verify, report, update canon/memory, clean temporary state.

## What this is not

- This is not the product monorepo.
- This does not version-control project application code.
- This does not replace each project's Git repo.
- This is not a dumping ground for task reports or random markdown.
- This is agent-agnostic and not tied to any single assistant or tool.

## Repository structure

- `AGENTS.md` — workspace entrypoint for agents.
- `.ai/core/` — shared workflow rules.
- `.ai/skills/` — sequential project onboarding and work skills.
- `.ai/state/` — temporary active-task memory only; self-cleans at closeout.
- `.ai/workspace/` — workspace project index and conventions.
- `.ai/scripts/` — utility scripts.
- `.ai/templates/` — reusable scaffolding templates.
- `projects/` — ignored folder containing actual project repos.

## Project Index

The committed project index template is:

- `.ai/workspace/project-index.example.md`

For local/private project routing, create:

- `.ai/workspace/project-index.local.md`

`project-index.local.md` is gitignored and may contain real project names, paths, status, and notes.

Agents should prefer `project-index.local.md` when it exists. If it does not exist, use `project-index.example.md` only as a format reference and infer the target project from the user's explicit target path or instruction.

Do not commit real/private project indexes.

## Project structure

Each onboarded project should have:

```txt
projects/<domain>/
  AGENTS.md
  .ai-project.md
  .ai-local/core-snapshot.md
  project-canon/
  app/source files...
```

- `project-canon/` is the authoritative durable project truth.
- `.ai-project.md` is the project-specific AI contract.
- `.ai-local/` is generated fallback only.
- Project app code is version-controlled by that project's own repo.

## Sequential skills

Onboarding existing repos should be sequential, not one giant task.

Skills are sequential checkpoints, not an automatic pipeline.

Each skill must stop after its final report.

Do not automatically run the next skill unless the user explicitly asks.

Optional onboarding entrypoint:

0. `project-adopt-pipeline` — orchestrate adoption checkpoints in `safe`, `autonomous-safe`, or `full-auto` mode while still stopping on safety boundaries.

1. `project-onboard` — structurally attach an existing repo to the workspace model.
2. `project-canon-seed` — create the first useful `project-canon/` baseline from light inspection.
3. `legacy-artifact-audit` — inventory and classify stale AI/task/docs artifacts before deletion.
4. `legacy-artifact-cleanup` — promote useful truth and remove stale/noisy artifacts.
5. `project-guardrails-profile` — define project-specific guardrails and verification profile.
6. `baseline-stabilize` — review the accumulated baseline changes before real work starts.
7. `ticket-workflow` — run the normal daily bug/feature loop after baseline readiness.

## How to onboard an existing project

High-level example using `projects/example-saas/`:

1. Place or move the existing repo under `projects/example-saas/`
2. Option A: run/use `.ai/skills/project-adopt-pipeline/SKILL.md` in `autonomous-safe` mode
3. Option B: run the individual skills manually in sequence starting with `.ai/skills/project-onboard/SKILL.md`
4. Continue through canon seeding, artifact audit/cleanup, guardrails, and baseline stabilization
5. Start real ticket work only after the adoption baseline is stable

## How real work should happen

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

## Verification policy

- Appropriate verification is default.
- E2E is escalation, not default.
- Use the narrowest reliable proof based on failure boundary and risk.
- Do not stop at typecheck for behavioral issues.
- Do not claim device/printer/offline/reconnect proof without actual proof.

## Markdown/file hygiene

- No free-floating markdown.
- Final reports belong in chat/ticket/PR, not random repo files.
- Durable project truth goes to `project-canon/`.
- Reusable workflow truth goes to `.ai/core/` or `.ai/workspace/`.
- Temporary task memory goes to `.ai/state/` and must be cleaned.
- Do not create project-local `.ai/`, `.agent/`, `.codex/`, `docs/`, `docs.legacy-review/`, `reports/`, `initiatives/`, `task-notes/`, or `plans/` unless explicitly approved.

## Version control model

- This repo tracks the AI workspace only.
- `projects/` is ignored by this repo.
- Each project under `projects/` keeps its own Git history and remote.
- Do not use Git submodules unless explicitly decided later.

Example commands:

```sh
git status --short
git add README.md AGENTS.md .ai .gitignore
git commit -m "docs: add ai-development workspace readme"
git push
```

## Current status

- Workspace baseline is established.
- Future projects should use the sequential skills.
- Project-specific onboarding and cleanup status belongs to each project's own repo and `project-canon/`.
