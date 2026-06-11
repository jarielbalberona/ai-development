# Memory Update Rules

Update `project-canon/` when:

- product behavior
- architecture
- domain rules
- permissions
- workflows
- API contracts
- database ownership/scoping rules
- deployment/runtime behavior
- integration behavior
- verification expectations for the project change

Update `.ai/` when:

- shared workflow rules change
- report format changes
- reusable verification rule changes
- recurring agent failure mode is discovered
- workspace convention changes
- project initialization/sync behavior changes

Clean `.ai/state/` when:

- task is complete
- temporary triage notes were superseded by report/canon
- findings were either promoted or discarded

Do not store in `.ai/state/` or `.ai/` as durable memory:

- raw command logs
- temporary debugging notes
- task transcripts
- stale reports
- generated noise
- duplicated project-canon content

Do not update `project-canon/` for styling-only changes, one-off implementation details, temporary debugging notes, or noisy logs.

## Markdown Hygiene

Do not create markdown as a substitute for memory discipline.

Task reports, old plans, scratch findings, completed initiatives, and handoff notes
must not be stored as random repo files.

Allowed destinations:

- durable project truth -> `project-canon/`
- reusable workflow truth -> `.ai/core/` or `.ai/workspace/`
- temporary task state -> `.ai/state/`, then cleaned
- final task report -> chat/ticket/PR, not a random repo markdown file

If the content is not durable or reusable, delete it.
