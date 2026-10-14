# Step 02: Boundary (Phases E–I)

**Phase:** Boundaries, Staging, Constraints, Risks, and Approach Boundaries  
**Inputs:** Completed `01-foundation.md` checkpoint  
**Checkpoint Produced:** `<initiative-slug>-scope/02-boundary.md`  
**Next Step:** `protocols/comprehensive/steps/03-readiness.md`

---

## 1. Operating Rules for This Step

- **Questioning cadence (C2):** Ask ONE question at a time. Each question carries a recommended answer. Never batch.
- **Traceability tagging (C7):** Every scope item and constraint must cite its evidence or intake origin tag. Orphan scope items (items with no origin tag) must be traced, labeled as an uninspected assumption, or cut.
- **The Splitting Rule (C8):** If boundary analysis reveals that the initiative contains two distinct systems or projects, **scope the first project now and park the second**. Do not balloon the scope to absorb both. Place parked work explicitly into Section 3 (Out of Scope / Parked Initiatives).

---

## 2. Core Mapping Cycle: Phases E–I

### Phase E — Scope and Boundaries
Partition the initiative across four explicit boundary containers:
1. **In Scope:** Committed deliverables, behaviors, integrations, and operational readiness items.
2. **Conditional:** Items included ONLY if a specific named condition or threshold is satisfied.
3. **Out of Scope:** Explicitly excluded items, deferred extensions, and parked sibling projects (C8).
4. **External Dependencies & Interfaces:** Work required for success but owned outside this initiative.

### Phase F — Sequence and Release Logic
Choose an appropriate staging model (do not force generic `v1/v2`):
- Models: *Now / Next / Later* | *Explore / Validate / Commit / Deliver* | *Prototype / Pilot / Launch / Scale* | *Prepare / Migrate / Stabilize / Retire*.
- For each stage define: Purpose, Included Scope, Entry Conditions, Exit Evidence, and Explicit Non-Goals.

### Phase G — Constraints, Resources, and Operating Context
Identify and classify boundaries:
- **Hard:** Violation makes the work invalid, unsafe, illegal, or infeasible.
- **Negotiable:** Real limits with room for tradeoff or approval.
- **Preference:** Desired but not required.
- **Unknown:** Possible constraint requiring verification.
- Categories: Time/deadlines, budget/resources, technical platform/compatibility, accessibility, legal/compliance, operational maintenance.

### Phase H — Assumptions, Dependencies, and Risks
1. **Load-Bearing Assumptions:** High-impact beliefs requiring validation. Include confidence, impact if wrong, test method, and owner.
2. **Critical Dependencies:** External providers, inputs, or approvals needed by a specific date, with fallbacks.
3. **Material Risks:** Cause → Event → Consequence, likelihood, impact, early signals, response plan, and accountable owner.

### Phase I — Approach Boundaries
Define approach parameters that constrain feasibility, outcomes, participation, or compliance—without micro-designing implementation:
- Good approach boundary: *"System must operate offline in field clinics with intermittent sync."*
- Implementation leak (reject): *"Use SQLite table schema with WAL mode enabled."*

---

## 3. Checkpoint Creation: `02-boundary.md`

Synthesize findings into `<initiative-slug>-scope/02-boundary.md`.

### Structure of `02-boundary.md`:
```markdown
# Checkpoint 02: Boundary — [Initiative Name]

## 1. Document Control & Upstream Checkpoint
- Initiative:
- Based on Checkpoint: `01-foundation.md` (verified)
- Date:

## 2. Scope Boundaries (Phase E)
### In Scope
- [Item 1] (source tag)
- [Item 2] (source tag)

### Conditional Scope
- [Item] — Condition: [Trigger / threshold] (source tag)

### Out of Scope & Parked Initiatives (C8 Splitting Rule)
- [Excluded Item 1] — Reason:
- [Parked Sibling Project] — Reason: Parked for future initiative per C8 splitting rule

### External Dependencies & Handoff Interfaces
- [External dependency] — Owner: [External team / service]

## 3. Sequence and Staging (Phase F)
- Model: [e.g. Prototype / Pilot / Launch]
- Stage Breakdown:
  - Stage 1: [Name] | Entry: [...] | Exit Evidence: [...] | Non-Goals: [...]
  - Stage 2: [Name] | Entry: [...] | Exit Evidence: [...] | Non-Goals: [...]

## 4. Constraints and Operating Context (Phase G)
| Constraint | Class (Hard/Negotiable) | Basis & Origin Tag | Consequence if Breached | Owner |
| --- | --- | --- | --- | --- |

## 5. Assumptions, Dependencies, and Risks (Phase H)
### Assumptions Register
| Assumption | Confidence | Impact if Wrong | Test / Validation Method | Owner / Due |
| --- | --- | --- | --- | --- |

### Dependencies Register
| Dependency | Provider | Needed By | Status | Fallback Plan | Owner |
| --- | --- | --- | --- | --- |

### Risks Register
| Risk (Cause → Event → Consequence) | Likelihood | Impact | Early Warning Signal | Response Plan | Owner |
| --- | --- | --- | --- | --- | --- |

## 6. Approach Boundaries (Phase I)
- [Settled approach boundaries that constrain design or delivery]

## 7. Foundation Amendments (if any)
- [Amendments made to 01-foundation.md decisions, with rationale]

## 8. C12 Decision Records: Milestone Close-Out
| Decision | Rationale | Alternatives Considered & Rejected | Owner | Date |
| --- | --- | --- | --- | --- |

## 9. Milestone Transition
- Status: Boundary complete
- Next phase: steps/03-readiness.md
- Blocking item: [none | specific blocking dependency]
```

### Verification Rule
After writing `<initiative-slug>-scope/02-boundary.md`, re-read the file with your tool to confirm host persistence before proceeding.

---

## 4. Checkable Step Completion Criteria (C6)

Do not advance to Step 03 until all items are observable in `02-boundary.md`:
- [ ] Boundaries clearly partitioned across In Scope, Conditional, Out of Scope, and External.
- [ ] Out of Scope section is non-empty; C8 splitting rule applied if oversized initiatives surfaced.
- [ ] All In Scope items carry origin evidence/intake tags (C7); zero orphan items.
- [ ] Staging logic specifies purpose, entry criteria, exit evidence, and non-goals.
- [ ] All constraints classified as Hard, Negotiable, Preference, or Unknown.
- [ ] Section 8 C12 Decision Records table populated with decisions made during Boundary analysis.
- [ ] File verified on disk via re-read.
- [ ] `Next phase: steps/03-readiness.md` structured pointer present.
