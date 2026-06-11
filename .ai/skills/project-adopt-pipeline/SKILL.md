# Project Adopt Pipeline

## Purpose

Orchestrate adoption of an existing repo through the existing sequential workspace skills.

This skill coordinates skills 1–6 only:

1. `project-onboard`
2. `project-canon-seed`
3. `legacy-artifact-audit`
4. `legacy-artifact-cleanup`
5. `project-guardrails-profile`
6. `baseline-stabilize`

It does not run `execute-work` by default. Real feature/bug/refactor work starts only after adoption baseline is stable and explicitly requested.

## Inputs

```txt
Project domain/folder name
Project path, usually projects/<domain>
Mode: safe, autonomous-safe, full-auto
Optional previous project name
Optional known surfaces
Optional cleanup aggression: conservative / normal / aggressive
```

## Default Mode

```txt
autonomous-safe
```

## Modes

### `safe`

- Run one skill at a time.
- Default to `project-onboard` only unless the user specifies another skill.
- Always stop after each skill report.

### `autonomous-safe`

- Run sequential onboarding skills automatically when the previous skill returns `PASS` and no stop condition exists.
- Allowed to run:
  - `project-onboard`
  - `project-canon-seed`
  - `legacy-artifact-audit`
  - `project-guardrails-profile`
  - `baseline-stabilize`
- May run `legacy-artifact-cleanup` only if cleanup candidates are clearly `DELETE_STALE` or `DELETE_NOISE`, no `REVIEW` items exist, no application behavior changes are needed, and durable truth has already been promoted.
- Must stop before risky deletion.

### `full-auto`

- May run `project-onboard` through `baseline-stabilize` without user confirmation when safe.
- May run `legacy-artifact-cleanup` after audit when no hard stop condition exists.
- Large or mixed root `docs/` trees must be processed in directory/topic batches, not treated as blockers by themselves.
- Size alone is not a blocker.
- Mixed content alone is not a blocker.
- Full-auto continues through cleanup and into `baseline-stabilize` unless a specific hard stop condition appears.
- Root `docs/` must not remain at the end of adoption unless the user explicitly approves it.
- Do not preserve root `docs/` or move it into a quarantine folder.
- Still must stop on safety boundaries.
- Does not run `execute-work` unless explicitly requested after baseline stabilization.

## Pipeline Sequence

1. `project-onboard`
2. `project-canon-seed`
3. `legacy-artifact-audit`
4. `legacy-artifact-cleanup`, only if mode allows and stop conditions do not apply
5. `project-guardrails-profile`
6. `baseline-stabilize`
7. stop

## Sequential Checkpoint Rule

Skills are sequential checkpoints, not an automatic pipeline.

This orchestration skill may continue to the next skill only when it is safe to do so under the selected mode.

Each child skill must still be treated as a checkpoint with its own final report and stop/continue decision.

Do not automatically continue when a stop condition exists or when the user specifically requested stop-after-current-skill.

## Hard stop conditions

- Current skill returns `PASS WITH ISSUES`, `FAIL`, or `BLOCKED`.
- Any `REVIEW` classification exists.
- Legacy artifact contains possible durable truth that cannot be confidently migrated.
- Root-level `docs/` contains files that cannot be safely classified.
- Cleanup would need to preserve root-level `docs/` without explicit user approval.
- File ownership is unclear and deletion risks active app/package docs.
- Cleanup would delete package-owned docs, app-owned docs, or source-adjacent files with unclear ownership.
- Cleanup requires application behavior changes.
- Active code/tests/tooling depend on a stale file and fixing that would modify app behavior.
- Git worktree has unrelated dirty changes.
- Verification fails.
- Secrets or credentials are found.
- `project-canon/`, code, and runtime evidence conflict in a way that needs human decision.
- The agent would need to create forbidden folders or random markdown.
- User specifically requested stop-after-current-skill.

If `.ai/workspace/project-index.local.md` cannot be created or updated, return `PASS WITH ISSUES` unless project adoption itself is otherwise blocked.

## Skill Boundaries

### `project-onboard`

- structural onboarding only
- do not seed full canon
- do not audit/delete legacy artifacts
- do not define project guardrails
- do not start ticket work
- ensure `.ai/workspace/project-index.local.md` is created or updated for the adopted project
- stop after final report

### `project-canon-seed`

- seed baseline canon only
- do not cleanup/delete legacy artifacts
- stop after final report

### `legacy-artifact-audit`

- assessment/classification only
- no deletion by default
- large or mixed root `docs/` trees are processed in batches, not treated as blockers by themselves
- stop only on exact `REVIEW_BLOCKER` files with reasons
- stop after final report

### `legacy-artifact-cleanup`

- destructive cleanup allowed only when explicitly invoked by this orchestration mode or directly by user request
- delete only after promotion/classification
- root-level `docs/` must not remain as a normal final state unless the user explicitly approves it
- stop after final report

### `project-guardrails-profile`

- define project guardrails and verification profile
- stop after final report

### `baseline-stabilize`

- review accumulated setup changes
- do not start feature/bug work
- stop after final report

### `execute-work`

- normal real work loop after project baseline is ready
- do not run as part of adoption unless explicitly requested after baseline stabilization

## Checkpoint Report

After each child skill, report:

```txt
Skill run
Verdict
Continue/Stop decision
Reason
Next skill
```

During the `project-onboard` checkpoint, the pipeline must ensure the local project index is updated.

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

An adoption-baseline result that stops at `baseline-stabilize` or earlier if safety boundaries require it.

Do not run execute-work by default.

## Final Pipeline Report

```md
## Verdict
PASS / PASS WITH ISSUES / FAIL / BLOCKED

## Summary

## Mode
safe / autonomous-safe / full-auto

## Project
- Name:
- Path:
- Previous name:

## Skills Run
- project-onboard:
- project-canon-seed:
- legacy-artifact-audit:
- legacy-artifact-cleanup:
- project-guardrails-profile:
- baseline-stabilize:

## Stop / Continue Decisions
List each checkpoint decision.

## Project Index Update
Updated: yes/no
File:
Entry:
Gitignored: yes/no

## Project Canon Updates

## Workspace AI Updates

## Deleted Files / Folders

## Root Docs Cleanup
- Root docs existed:
- Files/directories inspected:
- Promoted to project-canon:
- Moved to app/package docs:
- Deleted:
- Review blockers:
- Root docs final state:

## Markdown Hygiene

## Verification

## Git Status

## Risks / Gaps

## Next Recommended Step
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
