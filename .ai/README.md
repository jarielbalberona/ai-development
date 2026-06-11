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
