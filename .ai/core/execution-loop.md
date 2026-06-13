# Execution Loop

Ticket / pasted issue / work item
→ intake
→ choose work mode
→ triage
→ project-canon + repo grounding
→ spec finalization
→ execution
→ local/runtime verification
→ choose report format
→ report
→ project-canon update if durable project truth changed
→ `.ai` update if workflow/guardrail memory changed
→ task closeout

Rules:

- Choose work mode before triage.
- Triage is read-only.
- Read `project-canon/README.md` first, then use its `Canon Routing Index` to choose only the needed canon slices.
- Do not read the entire `project-canon/` tree by default.
- Implementation must be the smallest safe change.
- Verification must match the task type.
- Before running checks, choose the verification level based on the failure boundary.
- Do not default to E2E.
- Do not stop at typecheck for behavioral issues.
- If implementation or verification is blocked by a likely fixable prerequisite issue, attempt bounded self-heal before returning final `FAIL` or `BLOCKED`.
- Do not claim completion without proof.
- If verification is incomplete, report exactly what was not verified.
- Choose report format before closeout.
- Use short report unless the task requires full report.
- The final report must justify the selected verification level.
- The final report must briefly state whether the canon routing index was used, which canon files were read, and any routing gaps.
- If canon and current code/tests/runtime evidence disagree, surface the conflict and resolve it through the task instead of leaving silent drift behind.

Task closeout:

- update `project-canon/` if durable project truth changed
- correct stale canon in the same task when current evidence proves it wrong and the durable truth is clear
- update `.ai/` only if workflow/guardrail memory changed
- clean `.ai/state/` temporary task files
- check whether any new `.md`, `.mdx`, or `.txt` files were created
- keep new markdown/text files only when they match an approved location and purpose
- promote durable truth into `project-canon/`
- promote reusable workflow learning into `.ai/core/` or `.ai/workspace/`
- delete random reports, plans, handoffs, initiative notes, and scratch files
- regenerate `.ai-local/core-snapshot.md` if `.ai` core/project contract changed
- final report must state Project Canon Update, AI Memory Update, AI State Cleanup, and Markdown File Hygiene
