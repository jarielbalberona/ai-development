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
