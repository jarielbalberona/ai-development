# Projects

This folder is the local workspace location for product/application repositories.

Actual projects are version-controlled separately and are ignored by this parent
`ai-development` repository.

Expected local layout:

```txt
projects/
  <project-domain>/
  example-app/
  example-saas/
```

Each project should be onboarded into the AI development workspace using the
sequential skills under:

```txt
.ai/skills/
```

Recommended adoption path:

1. `project-adopt-pipeline` for semi-automatic adoption, or
2. manual sequence:

   * `project-onboard`
   * `project-canon-seed`
   * `legacy-artifact-audit`
   * `legacy-artifact-cleanup`
   * `project-guardrails-profile`
   * `baseline-stabilize`
   * `ticket-workflow`

Each onboarded project should eventually contain:

```txt
projects/<domain>/
  AGENTS.md
  .ai-project.md
  .ai-local/core-snapshot.md
  project-canon/
  <application source files>
```

Important rules:

* Do not commit project application code to this parent repo.
* Do not use Git submodules unless explicitly decided later.
* Do not create project-local `.ai/`, `.agent/`, or `.codex/` folders.
* Durable project truth belongs in each project's `project-canon/`.
* Final task reports belong in chat/ticket/PR, not random repo markdown files.
