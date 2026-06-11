# Docs Grounding Rules

- `project-canon/` is the authoritative curated project truth.
- `project-canon/` is authoritative but correctable.
- `docs/` is legacy/reference/unstructured docs.
- `.ai/` is the shared agent operating system.
- `.ai/` is not the authoritative project source of truth.
- `.ai-project.md` is the project-specific agent contract.
- Code and tests are executable truth.
- Tickets are work-intent truth.

Role separation:

- `project-canon/` holds durable project truth.
- `.ai/` holds workflow/operating-system truth and limited temporary state.
- `.ai/` must not duplicate `project-canon/` except for workflow pointers/summaries required by the operating model.
- `.ai-local/` is generated fallback only, never canonical.

Markdown discipline:

- Do not create random markdown/text files during grounding or triage.
- Durable project documentation belongs in `project-canon/`.
- Reusable workflow documentation belongs in `.ai/core/` or `.ai/workspace/`.
- Temporary task notes belong only in `.ai/state/` during active work and must be cleaned at closeout.

The ticket or pasted issue is the entry point, not the full source of truth.

Before implementation, factor in:

- project-canon
- legacy/reference docs when useful
- current code patterns
- architecture decisions
- domain rules
- project guardrails
- runtime evidence where available

If project-canon/, docs/, code, ticket, and runtime behavior disagree, surface the conflict during triage instead of silently choosing one.

Current code/tests/runtime evidence may reveal stale canon.

Do not silently follow stale canon.

Do not silently ignore canon.

Surface the conflict and resolve it through the task.

Migrated legacy-doc claims are baseline truth, not final certification.

When work touches an area represented by migrated canon, validate the claim against current code/tests/runtime evidence.

If validation disproves the migrated claim, update `project-canon/`.
