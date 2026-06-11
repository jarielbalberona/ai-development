# Verification Rules

Default verification mode:

```txt
Local-Verified
```

Runtime-Verified umbrella:

```txt
Runtime-Verified
├─ Local-Verified
├─ Browser-Verified
├─ API-Verified
├─ DB-Verified
├─ Device-Verified
└─ Preview-Verified
```

Rules:

- Local verification is the default for this workspace.
- Preview verification is optional and project/task-specific.
- Device verification is required when mobile, tablet, printer, or offline-first behavior is involved.
- DB verification is required for migrations, data isolation, and persistence changes.
- No fake success states.

## Verification Selection Rule

E2E is not the default verification mode.

The agent must choose verification based on the failure boundary, affected surface, and risk level.

Use the narrowest reliable proof that would catch the bug if it regressed.

If verification is blocked by a prerequisite/environment/tooling issue that is likely fixable inside the repo or local setup, run bounded self-heal before returning `FAIL` or `BLOCKED`.

Do not count a self-heal as verification proof. The original failed verification step must be rerun successfully before claiming that verification passed.

Preferred escalation order:

1. Static checks — typecheck, lint, import/build sanity
2. Unit tests — pure logic, validators, payload builders, state transitions
3. Component tests — UI state, rendering, form behavior
4. Integration/API tests — route/service/database/auth/tenant behavior
5. Local runtime/browser verification — user-facing behavior, cache, routing, UI flow
6. E2E tests — full critical journeys spanning frontend, backend, auth, database, and routing
7. Device/runtime verification — mobile, SQLite, printer, offline/reconnect, native behavior

Escalate to E2E only when:

- the issue spans multiple layers,
- the user-facing journey itself is the required proof,
- a critical revenue/POS/auth/tenant flow needs regression coverage,
- lower-level tests cannot prove the fix.

Do not use E2E by default for isolated logic, payload, component, styling, copy, or narrow API bugs.

Do not stop at typecheck when the issue is behavioral.

Allowed verdicts:

```txt
PASS
PASS WITH ISSUES
FAIL
BLOCKED
```
