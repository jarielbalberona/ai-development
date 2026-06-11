# Shared AI Workspace

This directory is the shared operating system for the workspace.

- `core/` holds canonical workflow and guardrail rules.
- `templates/` holds reusable project scaffolds.
- `workspace/` holds cross-project indexes and shared references.
- `scripts/` holds helper scripts for project setup and snapshot sync.
- `state/` holds temporary active-task working memory only.

Role separation:

- `.ai/` is not the project source of truth.
- `.ai/` must not become a documentation dump or second `project-canon/`.
- Durable project truth belongs in each project's `project-canon/`.
- Reusable workflow truth belongs in `.ai/core/` or `.ai/workspace/`.
- `.ai-local/` is generated fallback output only, not canonical memory.

Markdown/text file policy:

- No free-floating markdown.
- New `.md`, `.mdx`, or `.txt` files must fit an approved `.ai/` location and purpose.
- `.ai/` is not a place for random task reports, initiative archives, handoff notes, or scratch dumps.
- If content is not reusable workflow truth or temporary active-task state, do not create it here.

## Skills

Workspace skills live under `.ai/skills/`.

They are agent-agnostic procedural guides.

Use them sequentially. They are not project truth; project truth belongs in each project's `project-canon/`.

Skills are sequential checkpoints, not an automatic pipeline.

Each skill must stop after its final report.

Do not automatically run the next skill unless the user explicitly asks.

For semi-automatic adoption of an existing repo, use `project-adopt-pipeline` as the recommended onboarding entrypoint.

Default pipeline mode is `autonomous-safe`.

`full-auto` still stops on hard safety boundaries.

## Project Index

The committed project index template is:

- `.ai/workspace/project-index.example.md`

For local/private project routing, create:

- `.ai/workspace/project-index.local.md`

`project-index.local.md` is gitignored and may contain real project names, paths, status, and notes.

Agents should prefer `project-index.local.md` when it exists. If it does not exist, use `project-index.example.md` only as a format reference and infer the target project from the user's explicit target path or instruction.

Do not commit real/private project indexes.
