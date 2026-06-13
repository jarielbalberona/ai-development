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

Adoption boundary:

- root-level `docs/` is legacy by default during adoption
- `project-canon/` is the destination for durable project truth
- app/package docs are allowed only when truly local to the owning app/package
- root `docs/` must not remain as a normal final state unless explicitly approved by the user
- large or mixed root `docs/` trees must be processed in batches, not used as a blocker by themselves
- do not create quarantine folders such as `docs.legacy-review/`, `legacy-review/`, `review-backup/`, or `quarantine-docs/`

Canon correction:

- `project-canon/` is authoritative but correctable
- migrated legacy-doc claims are baseline truth, not final certification
- when work touches a canon area, validate migrated claims against current code/tests/runtime evidence
- if canon is stale, update it as part of the task

Canon routing:

- `project-canon/README.md` is the canon routing index for each project.
- It must include a `## Canon Routing Index` section that maps task surfaces to canon files.
- Agents should read `project-canon/README.md` first, then only the relevant canon slices.
- Do not read the entire `project-canon/` tree by default.

Markdown/text file policy:

- No free-floating markdown.
- New `.md`, `.mdx`, or `.txt` files must fit an approved `.ai/` location and purpose.
- `.ai/` is not a place for random task reports, initiative archives, handoff notes, or scratch dumps.
- Do not create project-local docs quarantine folders.
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

`execute-work` starts only after baseline stabilization and is not part of default project adoption.

During `execute-work`, likely fixable prerequisite blockers should receive bounded self-heal before final `FAIL` or `BLOCKED`; the original failed verification step still has to pass before proof is claimed.

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
