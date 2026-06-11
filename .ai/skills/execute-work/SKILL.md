# Execute Work

## Purpose

Normal real-work loop for bugs, features, refactors, follow-ups, and work items.

## Inputs

```txt
Project domain/folder name
Project path
Mode or phase, if applicable
Optional previous project name
Optional known surfaces
Formal ticket
Pasted issue
Plain bug report
Feature request
Refactor request
Assessment result approved for implementation
Direct user task
```

## Context Discovery

Before triage, determine:

- invocation directory
- workspace root
- target project root
- shared AI rules source
- fallback rule source
- project-canon path

Detection rules:

### Case A — invoked from workspace root

If current directory contains:

- `.ai/`
- `AGENTS.md`
- `projects/`

then:

- workspace root = current directory
- shared rules = `.ai/core/` and `.ai/skills/execute-work/SKILL.md`
- target project must be inferred from:
  - explicit `Target project: projects/<domain>` if provided
  - `.ai/workspace/project-index.local.md` if present
  - `.ai/workspace/project-index.example.md` as format reference only
  - user issue text if it names a project/path
- if target project cannot be inferred, ask for the target project before continuing

### Case B — invoked from inside a project

If current directory or an ancestor contains:

- `AGENTS.md`
- `.ai-project.md`
- `project-canon/`

and an ancestor two levels up contains:

- `.ai/`
- `projects/`

then:

- target project root = nearest ancestor containing `.ai-project.md` and `project-canon/`
- workspace root = nearest ancestor containing `.ai/` and `projects/`
- shared rules = `<workspace-root>/.ai/core/`
- skill source = `<workspace-root>/.ai/skills/execute-work/SKILL.md`

### Case C — parent workspace unavailable

If current directory is inside a project and parent `.ai/` cannot be found, but current project contains:

- `.ai-local/core-snapshot.md`
- `.ai-project.md`
- `project-canon/`

then:

- target project root = current project
- workspace root = unavailable
- shared rules = `.ai-local/core-snapshot.md`
- project rules = `AGENTS.md`, `.ai-project.md`, `project-canon/`
- continue using fallback
- final report must state that fallback was used

### Case D — invalid context

If neither workspace root nor project root can be found:

- stop before triage
- ask for the project path or workspace root
- do not inspect or edit random files

Required read order after context discovery:

If parent workspace is available:

1. `<workspace-root>/AGENTS.md`
2. `<workspace-root>/.ai/core/execution-loop.md`
3. `<workspace-root>/.ai/core/docs-grounding-rules.md`
4. `<workspace-root>/.ai/core/verification-rules.md`
5. `<workspace-root>/.ai/core/report-format.md`
6. `<target-project>/AGENTS.md`
7. `<target-project>/.ai-project.md`
8. `<target-project>/project-canon/README.md`
9. Relevant `<target-project>/project-canon/**`

If only project fallback is available:

1. `<target-project>/AGENTS.md`
2. `<target-project>/.ai-project.md`
3. `<target-project>/.ai-local/core-snapshot.md`
4. `<target-project>/project-canon/README.md`
5. Relevant `<target-project>/project-canon/**`

## Workflow

```txt
ticket or pasted issue or work item
→ intake
→ triage
→ project-canon grounding
→ code/runtime investigation
→ smallest safe implementation
→ appropriate verification
→ project-canon update if durable truth changed
→ .ai update only if workflow memory changed
→ .ai/state cleanup
→ final report
```

## Required Behavior

- Treat a formal ticket, pasted issue, bug report, feature request, refactor request, approved assessment follow-up, or direct user task as the work-intent artifact.
- Use a formal ticket when one exists. Otherwise treat the pasted issue or direct user request as the work-intent artifact.
- Discover workspace and project context before triage.
- Read relevant `project-canon/`.
- Treat `project-canon/` as authoritative but correctable.
- Do intake first.
- Triage before coding unless implementation is explicitly approved.
- Do not patch symptoms.
- Do not silently broaden scope.
- Use the smallest safe implementation.
- Use appropriate verification, not E2E by default.
- Update `project-canon/` only when durable truth changed.
- When work touches an area represented in `project-canon/`, validate canon against current code/tests/runtime evidence.
- If canon is stale, update it as part of the task.
- If canon and code disagree and the correct truth is unclear, report the conflict before implementation.
- Clean `.ai/state/` at closeout.
- Do not create random markdown reports.
- Do not assume the target project if multiple projects are possible and no project/path is named.
- Do not use `project-index.example.md` as a real project list.
- Prefer `project-index.local.md` when available.
- Never modify sibling projects unless explicitly requested.
- If invoked inside a project, default target project is that project.

## Prerequisite Self-Heal Mode

A prerequisite blocker that is likely fixable inside the repo or local setup should be self-healed before returning final `FAIL` or `BLOCKED`.

Distinguish these before deciding the final verdict:

- Product/work failure: the requested behavior, code path, or acceptance condition is still wrong after implementation.
- Verification prerequisite blocker: the implementation or verification step cannot run because a local prerequisite, invocation, generated artifact, fixture, service, or setup assumption is broken.

Examples of self-healable blockers:

- missing declared dependency or unresolved package/module
- stale dev server, test server, cache, or local process
- wrong package/script invocation
- package manager workspace mismatch
- generated file/snapshot/fallback out of date
- test fixture/reference path mismatch
- local service not running but startable
- local config/env mismatch detectable from committed files
- static check failure caused by the current task scope
- test failure caused by a narrow, identifiable setup issue

Examples of hard blockers:

- missing credentials/secrets
- inaccessible private package registry or private dependency
- external service outage
- required hardware unavailable
- destructive framework/runtime migration required
- broad dependency upgrade required
- unrelated dirty worktree prevents safe patching
- security-sensitive change requiring user approval
- unclear ownership of files that would need deletion/modification
- repeated failure after bounded self-heal attempts

Self-heal loop:

1. Identify the failed prerequisite.
2. Classify it as self-healable or hard-blocked.
3. Inspect the smallest relevant surface.
4. Apply the smallest safe fix.
5. Rerun the failed command or verification step.
6. Continue the original work goal.
7. Stop only after max attempts or a hard blocker.

Default max attempts:

- 2 self-heal attempts per distinct prerequisite blocker.

If the same blocker remains after 2 attempts:

- return `FAIL` or `BLOCKED` with exact evidence.

Rules:

- Do not turn a narrow blocker into a broad rewrite.
- Do not perform major framework/runtime upgrades without explicit approval.
- Do not install or remove dependencies blindly.
- Do not modify unrelated application behavior.
- Do not claim verification proof until the original failed verification step has been rerun successfully.
- If the self-heal changes durable project truth, update `project-canon/`.
- If the self-heal reveals a reusable workflow rule, update parent `.ai/`.
- Clean `.ai/state/` at closeout.

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

A verified task result with clear report.

This skill is the normal real-work loop after project baseline readiness is already established.

## Closeout

Report:

```txt
Context Discovery
Project Canon Update
AI Memory Update
AI State Cleanup
Markdown File Hygiene
Verification Selection, where applicable
Self-Heal Attempts, where applicable
```

Use the shared report format from:

```txt
.ai/core/report-format.md
```

## Context Discovery

```md
## Context Discovery
- Invocation directory:
- Workspace root:
- Target project:
- Shared rules source:
- Fallback used: yes/no
- Project canon:
```

## Self-Heal Attempts

```md
## Self-Heal Attempts
Attempted: yes/no

### Attempt 1
Blocker:
Classification:
Fix attempted:
Result:

### Attempt 2
Blocker:
Classification:
Fix attempted:
Result:

Final blocker status:
```
