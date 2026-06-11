# Project Index Example

This file, `project-index.example.md`, is committed as a safe template for the AI development workspace.

For local/private project routing, copy this file to:

```txt
.ai/workspace/project-index.local.md
```

`project-index.local.md` is gitignored and may contain real project names, paths, status, and notes.

Agents should prefer `project-index.local.md` when it exists. If it does not exist, use this file only as a format reference and infer the target project from the user's explicit path or instruction.

## Projects

### <project-domain>

Path: `projects/<project-domain>`
Status: active | placeholder | archived
Default verification: Local-Verified
Project canon: `projects/<project-domain>/project-canon/README.md`
Notes: Short routing notes for this project.

### example-app

Path: `projects/example-app`
Status: example
Default verification: Local-Verified
Project canon: `projects/example-app/project-canon/README.md`
Notes: Placeholder example only.
