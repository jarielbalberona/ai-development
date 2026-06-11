# Execution Loop

Ticket / pasted issue
→ triage
→ project-canon + repo grounding
→ spec finalization
→ execution
→ local/runtime verification
→ report
→ project-canon update if durable project truth changed
→ `.ai` update if workflow/guardrail memory changed
→ task closeout

Rules:

- Triage is read-only.
- Implementation must be the smallest safe change.
- Verification must match the task type.
- Before running checks, choose the verification level based on the failure boundary.
- Do not default to E2E.
- Do not stop at typecheck for behavioral issues.
- Do not claim completion without proof.
- If verification is incomplete, report exactly what was not verified.
- The final report must justify the selected verification level.

Task closeout:

- update `project-canon/` if durable project truth changed
- update `.ai/` only if workflow/guardrail memory changed
- clean `.ai/state/` temporary task files
- check whether any new `.md`, `.mdx`, or `.txt` files were created
- keep new markdown/text files only when they match an approved location and purpose
- promote durable truth into `project-canon/`
- promote reusable workflow learning into `.ai/core/` or `.ai/workspace/`
- delete random reports, plans, handoffs, initiative notes, and scratch files
- regenerate `.ai-local/core-snapshot.md` if `.ai` core/project contract changed
- final report must state Project Canon Update, AI Memory Update, AI State Cleanup, and Markdown File Hygiene
