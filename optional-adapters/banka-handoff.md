# Optional Banka Handoff Adapter

**Status:** Explicit opt-in only. This file is not part of normal ASMP.

Use this adapter only when a person has a **completed, independently valid** `IDEA-SCOPE.md` and explicitly asks to prepare it for **Banka** as the receiving workflow.

ASMP does not require Banka. Banka does not require ASMP. This adapter must not run during normal scoping.

---

## Prerequisites

Before starting:

1. **A completed ASMP scope artifact** — `IDEA-SCOPE.md` produced under ASMP Compact or ASMP Comprehensive, or an equivalent scope document with the same decision quality.
2. **The current Banka protocol** — supplied or identified by the person. Do not assume a version. Do not use a cached or copied Banka rubric from this repository.
3. **Explicit approval** — the person has asked for a Banka-ready handoff pass.

If any prerequisite is missing, stop and complete normal ASMP first.

---

## What this adapter does

1. Read the completed `IDEA-SCOPE.md` as the authoritative scope.
2. Read the **externally supplied** Banka protocol the person identifies.
3. Check whether the scope artifact contains what Banka expects for origin-scope intake.
4. Produce a **separate handoff note** (for example `BANKA-HANDOFF.md`) listing:
   - what is already present and ready;
   - gaps Banka may still need to resolve;
   - open items that Banka should not treat as settled;
   - recommended next step under Banka's own rules.

Do **not** rewrite or replace `IDEA-SCOPE.md`. Do **not** embed Banka tier decisions, rubric answers, or templates into the canonical scope.

---

## What to verify in the scope artifact

Without copying Banka's rubric here, confirm the completed scope explicitly addresses:

- purpose, including a real before/after account;
- users or beneficiaries and meaningfully different user types, where relevant;
- staged capability or deliverable scope, where relevant;
- individually classified constraints;
- a concrete end-to-end definition-of-done scenario;
- unresolved decisions and verification needs, honestly labeled.

If the scope is missing material Banka requires, record the gap in the handoff note. Do not invent content.

---

## Running Banka's own assessment

Banka tier selection, complexity assessment, and project structure are **Banka's responsibility**.

When the person supplies the current Banka protocol:

1. Follow Banka's documented intake and rubric procedures exactly as written in that protocol.
2. Cite evidence from `IDEA-SCOPE.md` for each assessment item.
3. Let Banka make the final tier and structure decision under its own current rules.

Do not force Banka's assessment onto non-coding work. Do not convert `Unclear` or `Open` items into confirmed answers.

---

## Output contract

| Artifact | Role |
| --- | --- |
| `IDEA-SCOPE.md` | Canonical, protocol-neutral scope. Unchanged except for corrections the person explicitly approves. |
| `BANKA-HANDOFF.md` (or equivalent) | Optional companion note for Banka intake. Contains Banka-specific readiness commentary only. |

The handoff note may reference sections of `IDEA-SCOPE.md` but must not become a second authority over scope decisions.

---

## Boundaries

- This adapter does not run automatically after ASMP.
- This adapter does not modify ASMP protocols, templates, or examples.
- This repository does not maintain a copy of Banka's rubric, tier rules, templates, or skills.
- If Banka is not the chosen receiver, ignore this file entirely.
