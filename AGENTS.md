# Workspace Agent Entrypoint

This workspace is agent-agnostic.
All product/application repos live under `projects/`.
Shared workflow rules live under `.ai/core/`.
Each project owns `project-canon/` as curated authoritative source of truth.
Existing `docs/` folders are legacy/reference unless a project explicitly says otherwise.
Each project has `.ai-project.md` as the project-specific contract.
Each project has `.ai-local/core-snapshot.md` as generated fallback.
Default verification is `Local-Verified`.
Do not modify sibling projects unless explicitly instructed.

## Operating model

This workspace uses **Ticket-First, Docs-Grounded, Local-Verified Closed Loop**.

`Docs-Grounded` means the agent should ground itself primarily in `project-canon/`, with `docs/` used only as supporting legacy/reference material when present.

Role separation:

- `project-canon/` is the authoritative project source of truth for durable product, domain, architecture, operations, integration, permission, workflow, and verification truth.
- `.ai/` is the shared agent operating system for workflow rules, triage rules, verification rules, report format, workspace conventions, project index, scripts, and limited temporary state.
- `.ai/` must not become a second docs folder or a duplicate of `project-canon/` except for workflow pointers/summaries required by the operating model.
- `.ai-local/` is a generated fallback snapshot only. It is not canonical.
- `.ai/state/` is temporary task working state only and must be cleaned at task closeout.

## Markdown File Creation Policy

No free-floating markdown.

Agents must not create random `.md`, `.mdx`, `.txt`, reports, plans, handoffs,
initiative notes, task summaries, or scratch files.

Every markdown/text file must belong to an approved location:

- `.ai/core/` for shared workflow rules
- `.ai/workspace/` for workspace conventions/indexes
- `.ai/state/` for temporary active-task memory only
- `projects/<domain>/project-canon/` for durable project truth
- `projects/<domain>/AGENTS.md` and `.ai-project.md` for project entry/contract
- `projects/<domain>/.ai-local/core-snapshot.md` for generated fallback only
- app/package-local README or AGENTS files only when genuinely local

If a task needs a final report, provide it in the chat/ticket/PR report. Do not
create a random markdown report file unless explicitly requested.

## Sequential Skills

For existing projects added under `projects/<domain>/`, do not run onboarding as one giant task.

Skills are sequential checkpoints, not an automatic pipeline.

Each skill must stop after its final report.

For users who want semi-automatic adoption of an existing repo, use `project-adopt-pipeline` as the onboarding entrypoint.

Default pipeline mode is `autonomous-safe`.

`full-auto` may continue further without confirmation, but it still stops on hard safety boundaries.

Use the skills under `.ai/skills/` in this order:

0. `project-adopt-pipeline` (optional orchestrator)
1. `project-onboard`
2. `project-canon-seed`
3. `legacy-artifact-audit`
4. `legacy-artifact-cleanup`
5. `project-guardrails-profile`
6. `baseline-stabilize`
7. `ticket-workflow`

Each skill has a narrow scope and stop point.

Do not automatically run the next skill unless the user explicitly asks.

Do not combine onboarding, canon seeding, cleanup, and real feature work in one pass.

## Required read order

1. `.ai/core/execution-loop.md`
2. `.ai/core/docs-grounding-rules.md`
3. `.ai/workspace/project-index.local.md` when present, otherwise `.ai/workspace/project-index.example.md`
4. `projects/<target-project>/.ai-project.md`
5. `projects/<target-project>/project-canon/README.md`
6. Relevant files under `projects/<target-project>/project-canon/`
7. Legacy/reference docs under `projects/<target-project>/docs/` only when useful
