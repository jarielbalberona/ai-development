# Skills

Sequential workspace skills for onboarding existing projects and running project work.

Recommended sequence:

1. `project-onboard`
2. `project-canon-seed`
3. `legacy-artifact-audit`
4. `legacy-artifact-cleanup`
5. `project-guardrails-profile`
6. `baseline-stabilize`
7. `ticket-workflow`

## `project-onboard`

Purpose: attach an existing repo under `projects/<domain>/` to the workspace structure.

When to use: first structural onboarding pass for an existing repo.

What it must not do: no deep project documentation, no stale-artifact deletion, no application-code changes, no project-local `.ai/`, `.agent/`, `.codex/`, and no `CLAUDE.md`.

Next skill: `project-canon-seed`

## `project-canon-seed`

Purpose: create the first useful `project-canon/` baseline from light repo inspection.

When to use: after structural onboarding is complete and before cleanup.

What it must not do: no full architecture audit, no stale-file deletion, no wholesale dumping of old docs into canon.

Next skill: `legacy-artifact-audit`

## `legacy-artifact-audit`

Purpose: inventory and classify stale AI/task/docs artifacts before deleting anything.

When to use: after a project has a usable `project-canon/` baseline.

What it must not do: no deletion by default, no application-code changes, no permanent quarantine folders unless explicitly approved.

Next skill: `legacy-artifact-cleanup`

## `legacy-artifact-cleanup`

Purpose: execute the cleanup plan from `legacy-artifact-audit`.

When to use: after artifact classification is complete and approved by scope.

What it must not do: no application-behavior changes, no wholesale dumping of stale files into canon, no commit unless explicitly asked.

Next skill: `project-guardrails-profile`

## `project-guardrails-profile`

Purpose: define project-specific guardrails and verification profile.

When to use: after project structure, canon baseline, and stale cleanup are in place.

What it must not do: no invented product claims, no fake PASS, no E2E-by-default posture.

Next skill: `baseline-stabilize`

## `baseline-stabilize`

Purpose: review onboarding/canon/cleanup/guardrail changes before real ticket work starts.

When to use: just before first real ticket work or commit preparation.

What it must not do: no new product claims, no broad validation, no feature/bug implementation.

Next skill: `ticket-workflow`

## `ticket-workflow`

Purpose: run the normal daily work loop for real bugs/features.

When to use: after the baseline is stable and the repo is ready for normal work.

What it must not do: no random markdown reports, no silent scope expansion, no E2E by default.

Next skill: continue ticket work; loop back to canon/guardrails only when durable truth changes.
