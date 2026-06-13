# Report Format

Use short report by default for small or normal tasks.

Use full report for:

- high-risk changes
- multi-surface changes
- adoption or cleanup
- migrations
- device or runtime work
- security, auth, tenant, or data-isolation work
- failed or partial verification
- explicit user request

The agent must not emit audit-sized reports for trivial fixes.

## Short Report

Default for small or normal tasks.

```md
## Verdict
PASS / PASS WITH ISSUES / FAIL / BLOCKED

## Summary

## Work Mode

## Files Changed

## Verification Selection
Selected:
Reason:
Why E2E was/was not needed:

## Verification

## Canon Routing
README index used: yes/no
Canon files read:
Routing gaps:

## Project Canon Update
Updated: yes/no
Reason:

## AI Memory Update
Updated: yes/no
Reason:

## AI State Cleanup
Cleaned: yes/no

## Markdown File Hygiene
New markdown/text files created: yes/no

## Risks / Gaps

## Git Status
```

## Full Report

Use for high-risk, runtime/device, DB/schema, adoption/cleanup, security/auth, multi-surface, or partial-failure work.

Full report keeps the detailed sections below.

```md
## Verdict
PASS / PASS WITH ISSUES / FAIL / BLOCKED

## Summary
What was done or found.

## Context Discovery

## Work Mode

## Root Cause

## Files Changed
Grouped by area.

## Behavior Changed
User-visible or system-visible behavior changes.

## Verification Selection
Selected verification level:
Reason:
Why E2E was/was not needed:
Self-heal used before final verdict: yes/no
Reason:

## Self-Heal Attempts
Attempted: yes/no

### Attempt 1
Blocker:
Classification:
Fix attempted:
Result:

### Attempt 2
Blocker:
Classification:
Fix attempted:
Result:

Final blocker status:

## Verification
Commands, tests, local runtime checks, browser checks, device checks, DB checks.

## Canon Routing
README index used: yes/no
Canon files read:
Routing gaps:

## Risks / Gaps
Anything not verified, deferred, risky, or blocked.

## Project Canon Update
Updated: yes/no
Files:
Reason:
Stale canon corrected: yes/no

## Canon / Runtime Conflict
Found: yes/no
Summary:
Resolution:

## Legacy Docs Reference
Used: yes/no
Files:
Reason:

## Root Docs Cleanup
- Root docs existed:
- Files/directories inspected:
- Promoted to project-canon:
- Moved to app/package docs:
- Deleted:
- Review blockers:
- Root docs final state:

## AI Memory Update
Updated: yes/no
Files:
Reason:

## AI State Cleanup
Cleaned: yes/no
Files removed:
Files retained:
Reason if retained:

## Markdown File Hygiene
New markdown/text files created: yes/no
Files:
Approved location/purpose:
Deleted temporary/random files:
Remaining concerns:

## Git Status
```
