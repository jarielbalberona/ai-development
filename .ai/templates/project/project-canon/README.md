# Project Canon

This directory is the curated authoritative source of truth for the project.

- Keep product, architecture, domain, operations, decisions, and changelog documentation here.
- Update project-canon when durable project truth changes.
- Do not use project-canon for temporary debugging notes.

## Canon Routing Index

This section maps common task surfaces to the canon files agents should read.

| Task surface | Read first | Also read when needed |
|---|---|---|
| Product/workflow | `product/overview.md`, `product/workflows.md` | `domain/business-rules.md` |
| Roles/permissions | `product/user-roles.md`, `domain/permissions.md` | `architecture/backend.md` |
| Domain/business rules | `domain/entities.md`, `domain/business-rules.md` | `product/workflows.md` |
| Frontend/UI | `architecture/frontend.md` | `product/workflows.md` |
| Backend/API | `architecture/backend.md` | `domain/business-rules.md`, `domain/permissions.md` |
| Database/persistence | `architecture/database.md` | `domain/entities.md`, `operations/troubleshooting.md` |
| Integrations | `architecture/integrations.md` | `operations/environments.md` |
| Deployment/environments | `operations/deployment.md`, `operations/environments.md` | `operations/troubleshooting.md` |
| Verification/testing | `operations/verification-profile.md` | relevant architecture/domain files |
| Mobile/offline/device | `architecture/mobile.md`, `architecture/offline-first.md`, `operations/mobile-verification.md` | `domain/mobile-pos-rules.md` |

Note:

- Only include mobile/offline rows when the project has those files or surfaces.
- Omit categories that do not apply, or mark them `Not applicable`.
