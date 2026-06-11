# AI Development Workspace

## What this is

This repository contains the shared AI-assisted development operating system used to onboard and work on existing software projects.

It is built around:

`Ticket-First, Docs-Grounded, Local-Verified Closed Loop`

- Ticket-First: use a formal ticket when one exists; otherwise treat the pasted issue or direct user request as the work-intent artifact.
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
- `projects/` — parent folder tracked only for `projects/README.md`; all actual project folders under `projects/*` are ignored and version-controlled separately.

## Project Index

The committed project index template is:

- `.ai/workspace/project-index.example.md`

For local/private project routing, create:

- `.ai/workspace/project-index.local.md`

`project-index.local.md` is gitignored and may contain real project names, paths, status, and notes.

Agents should prefer `project-index.local.md` when it exists. If it does not exist, use `project-index.example.md` only as a format reference and infer the target project from the user's explicit target path or instruction.

Do not commit real/private project indexes.

When a project is onboarded or adopted, update `.ai/workspace/project-index.local.md` if it exists.

If it does not exist, create it from `.ai/workspace/project-index.example.md` and add the adopted project entry.

Do not update `.ai/workspace/project-index.example.md` with real project names.

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
- `project-canon/` is authoritative but correctable when current code/tests/runtime evidence proves it stale or wrong.
- `.ai-project.md` is the project-specific AI contract.
- `.ai-local/` is generated fallback only.
- Project app code is version-controlled by that project's own repo.
- Root-level `docs/` is not a normal final state for adopted projects.
- App/package docs are allowed only when they are truly local to the owning app/package.

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
4. `legacy-artifact-cleanup` — promote useful truth and remove stale/noisy artifacts, including eliminating root-level `docs/` unless explicitly approved.
5. `project-guardrails-profile` — define project-specific guardrails and verification profile.
6. `baseline-stabilize` — review the accumulated baseline changes before real work starts.
7. `execute-work` — run the normal daily work loop for bugs, features, refactors, follow-ups, and work items after baseline readiness.

## How to onboard an existing project

High-level example using `projects/example-saas/`:

1. Place or move the existing repo under `projects/example-saas/`
2. Option A: run/use `.ai/skills/project-adopt-pipeline/SKILL.md` in `autonomous-safe` mode
3. Option B: run the individual skills manually in sequence starting with `.ai/skills/project-onboard/SKILL.md`
4. Continue through canon seeding, artifact audit/cleanup, guardrails, and baseline stabilization
5. Ensure `.ai/workspace/project-index.local.md` is updated for the adopted project
6. Start real ticket work only after the adoption baseline is stable

## How real work should happen

```txt
ticket/plain issue
→ triage
→ project-canon grounding
→ code/runtime investigation
→ minimal implementation
→ bounded self-heal for fixable prerequisite blockers, if needed
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
- If verification is blocked by a likely fixable local prerequisite, apply bounded self-heal before a final `FAIL` or `BLOCKED` verdict.
- Do not claim verification proof until the original failed verification step has been rerun successfully.

## Markdown/file hygiene

- No free-floating markdown.
- Final reports belong in chat/ticket/PR, not random repo files.
- Durable project truth goes to `project-canon/`.
- Reusable workflow truth goes to `.ai/core/` or `.ai/workspace/`.
- Temporary task memory goes to `.ai/state/` and must be cleaned.
- Do not create project-local `.ai/`, `.agent/`, `.codex/`, `docs/`, `reports/`, `initiatives/`, `task-notes/`, or `plans/` unless explicitly approved.

## Root Docs Policy

- Root-level `docs/` is legacy by default during project adoption.
- Large or mixed root `docs/` trees are not blockers by themselves. Process them by directory/topic batches.
- The agent must inspect and classify the root `docs/` tree, promote durable truth into `project-canon/`, move truly local app/package docs only when ownership is obvious, delete stale/noisy docs, and report exact `REVIEW_BLOCKER` files with reasons when classification is unsafe.
- Root `docs/` must not survive adoption as a normal final state unless the user explicitly approves it.
- Do not create quarantine folders as a fallback. Final reports belong in chat/ticket/PR, not repo markdown.

## Canon Correction

- `project-canon/` is authoritative but correctable.
- Migrated legacy-doc claims are baseline truth, not final certification.
- When real work touches an area represented in canon, validate it against current code, tests, and runtime evidence.
- If current evidence disproves canon, update `project-canon/` in the same task once the durable truth is clear.
- If canon and current evidence conflict but the correct truth is unclear, report the conflict before implementation.

## Version control model

- This repo tracks the AI workspace only.
- The parent repo tracks only `projects/README.md`; all actual project folders under `projects/*` are ignored and version-controlled separately.
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
