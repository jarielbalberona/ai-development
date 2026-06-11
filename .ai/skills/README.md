# Skills

Sequential workspace skills for onboarding existing projects and running project work.

Skills are sequential checkpoints, not an automatic pipeline.

Each skill must stop after its final report.

Do not automatically run the next skill unless the user explicitly asks.

## Project Index

The committed project index template is:

- `.ai/workspace/project-index.example.md`

For local/private project routing, create:

- `.ai/workspace/project-index.local.md`

`project-index.local.md` is gitignored and may contain real project names, paths, status, and notes.

Agents should prefer `project-index.local.md` when it exists. If it does not exist, use `project-index.example.md` only as a format reference and infer the target project from the user's explicit target path or instruction.

Do not commit real/private project indexes.

When a project is onboarded or adopted, update `.ai/workspace/project-index.local.md` if it exists.

If `project-index.local.md` does not exist, create it from `project-index.example.md` and add the adopted project entry.

Do not update `project-index.example.md` with real project names.

Recommended sequence:

0. `project-adopt-pipeline` (optional orchestrator)
1. `project-onboard`
2. `project-canon-seed`
3. `legacy-artifact-audit`
4. `legacy-artifact-cleanup`
5. `project-guardrails-profile`
6. `baseline-stabilize`
7. `execute-work`

Individual skills can still be run manually.

`project-adopt-pipeline` runs sequential checkpoints and stops on safety conditions.
In `full-auto`, large or mixed root `docs/` trees must be processed in directory/topic batches and removed by the end of adoption unless explicitly approved.

## `project-adopt-pipeline`

Purpose: orchestrate skills 1–6 for existing repos without starting real ticket work.

When to use: when the user wants semi-automatic adoption of an existing repo under `projects/<domain>/`.

What it must not do: no `execute-work` by default, no application-behavior changes, no random markdown, no preserving root `docs/` as a normal final state, and no bypassing hard stop conditions.

Next skill: `execute-work` only after baseline stabilization and only when the user explicitly asks for real work.

## `project-onboard`

Purpose: attach an existing repo under `projects/<domain>/` to the workspace structure.

When to use: first structural onboarding pass for an existing repo.

What it must not do: no deep project documentation, no stale-artifact deletion, no application-code changes, no project-local `.ai/`, `.agent/`, `.codex/`, and no `CLAUDE.md`.

Next skill: `project-canon-seed` when the user explicitly asks for the next checkpoint, or when `project-adopt-pipeline` continues under a safe mode.

## `project-canon-seed`

Purpose: create the first useful `project-canon/` baseline from light repo inspection.

When to use: after structural onboarding is complete and before cleanup.

What it must not do: no full architecture audit, no stale-file deletion, no wholesale dumping of old docs into canon.

Next skill: `legacy-artifact-audit` when the user explicitly asks for the next checkpoint, or when `project-adopt-pipeline` continues under a safe mode.

## `legacy-artifact-audit`

Purpose: inventory and classify stale AI/task/docs artifacts before deleting anything.

When to use: after a project has a usable `project-canon/` baseline.

What it must not do: no deletion by default, no application-code changes, no quarantine-folder fallback, and no treating root-level `docs/` as normal final-state docs by default. Size or mixed content alone is not a blocker.

Next skill: `legacy-artifact-cleanup` when the user explicitly asks for the next checkpoint, or when `project-adopt-pipeline` continues under a safe mode.

## `legacy-artifact-cleanup`

Purpose: execute the cleanup plan from `legacy-artifact-audit`.

When to use: after artifact classification is complete and approved by scope.

What it must not do: no application-behavior changes, no wholesale dumping of stale files into canon, no preserving root-level `docs/` as a normal final state without explicit approval, and no commit unless explicitly asked.

Next skill: `project-guardrails-profile` when the user explicitly asks for the next checkpoint, or when `project-adopt-pipeline` continues under a safe mode.

## `project-guardrails-profile`

Purpose: define project-specific guardrails and verification profile.

When to use: after project structure, canon baseline, and stale cleanup are in place.

What it must not do: no invented product claims, no fake PASS, no E2E-by-default posture.

Next skill: `baseline-stabilize` when the user explicitly asks for the next checkpoint, or when `project-adopt-pipeline` continues under a safe mode.

## `baseline-stabilize`

Purpose: review onboarding/canon/cleanup/guardrail changes before real ticket work starts.

When to use: just before first real ticket work or commit preparation.

What it must not do: no new product claims, no broad validation, no feature/bug implementation.

Next skill: `execute-work` when the user explicitly asks for the next checkpoint. It is not part of default adoption.

## `execute-work`

Purpose: run the normal daily work loop for bugs, features, refactors, follow-ups, and work items.

When to use: after the baseline is stable and the repo is ready for normal work.

What it must not do: no random markdown reports, no silent scope expansion, no E2E by default, and no silent drift between canon and current code/runtime truth.

Next skill: continue work only when the user explicitly asks. Loop back to canon/guardrails only when durable truth changes.
