# Step 03: Readiness & Gates (Phases J–L)

**Phase:** Definition of Done, Governance, Handoff, and Completion Gates  
**Inputs:** Completed `01-foundation.md` and `02-boundary.md` checkpoints  
**Checkpoint Produced:** `<initiative-slug>-scope/03-readiness.md`  
**Next Step:** `protocols/comprehensive/steps/04-synthesis.md`

---

## 1. Operating Rules for This Step

- **Questioning cadence (C2):** Ask ONE question at a time with a recommended answer. Never batch.
- **Surgical Gate Return (C9):** The completion gates below are BLOCKING. If a gate fails its explicit check, do not restart the scoping cycle. Re-open and repair only the specific failing phase or section, update the checkpoint, and re-test that gate.

---

## 2. Core Mapping Cycle: Phases J–L

### Phase J — Validation and Definition of Done
Define completion at four distinct operational levels:
1. **Output Complete:** Deliverables exist, pass technical/quality checks, and match boundary commitments.
2. **Capability Ready:** Target actors can operate, support, and use the deliverable without heroic intervention.
3. **Outcome Evidenced:** Target success indicators are observable or measurement telemetry is live.
4. **Transition Complete:** Adoption, migration, training, and operational handoff criteria are satisfied.

*Mandatory Scenarios:*
- **End-to-End Acceptance Scenario:** Given starting condition X, actor Y executes realistic workflow Z, achieving outcome W verified by observable evidence E.
- **Edge / Failure Scenario:** Realistic failure or stress condition, verifying graceful degradation or rollback.

### Phase K — Governance and Change
1. **Decision Rights & Approval:** Who holds authority to approve scope, budget, schedule, or architecture changes?
2. **Escalation Path:** Who resolves blocked or contested trade-offs?
3. **Change Criteria:** What specific evidence permits the scope to expand, shrink, or halt?
4. **Living Artifact Location:** Where will change history and living plans be tracked after scoping?

### Phase L — Handoff Readiness
1. **Receiving Discipline:** Engineering | Product Design | Research | Operations | Vendor Procurement | Governance.
2. **Ready Inputs:** Checkpoints and assets ready for immediate intake.
3. **Remaining Prerequisites:** Unblockers that must be completed prior to receiver kickoff.
4. **Next Responsible Action:** Exactly ONE named next action with ONE named accountable owner.

---

## 3. Completion Gates Evaluation (C9)

Every gate has explicit pass/fail checks. Record the evaluation in the Gate Log.

### Baseline Gates (Mandatory for all initiatives)
- **Gate A — Artifact & Evidence Coverage:** Did we inspect all supplied materials? Are unavailable critical sources documented as limitations?
  - *Pass criteria:* All provided sources tagged; zero uninspected attachments.
  - *Failure return (C9):* Return to Step 00 / Step 01 to inspect missing items.
- **Gate B — Real-Example Walkthrough:** Walked through a real case from trigger to completion?
  - *Pass criteria:* Named real-world case tested against boundary and acceptance scenarios.
  - *Failure return (C9):* Return to Phase J scenarios.
- **Gate C — Internal Consistency:** Are vocabulary, boundaries, stages, constraints, and handoffs mutually compatible?
  - *Pass criteria:* Zero contradictory definitions or scope assignments.
  - *Failure return (C9):* Return to specific conflicting phase.
- **Gate D — Open-Item Integrity:** Do all open items have accountable owners, test methods, and trigger dates?
  - *Pass criteria:* Zero ownerless open items.
  - *Failure return (C9):* Return to Phase H or Phase L.
- **Gate E — Proportionality:** Is the detail level proportionate to consequence and reversibility?
  - *Pass criteria:* No ceremonial filler; load-bearing exclusions and risks preserved.
  - *Failure return (C9):* Trim or elaborate affected sections.

### Conditional Gates (Execute if applicable)
- **Gate F — Operability & Lifecycle:** Required if deliverable must be maintained or supported over time.
- **Gate G — Harm, Abuse & Exclusion:** Required if public or vulnerable users are affected.
- **Gate H — Feasibility Spike:** Required if core mechanisms involve novel or uncertain technology.
- **Gate I — Transition & Failure Readiness:** Required for migrations, replacements, or service cutovers.
- **Gate J — Independent Review:** Required if external regulatory, legal, or compliance approval is mandated.

---

## 4. Checkpoint Creation: `03-readiness.md`

Synthesize readiness and gate results into `<initiative-slug>-scope/03-readiness.md`.

### Structure of `03-readiness.md`:
```markdown
# Checkpoint 03: Readiness & Gates — [Initiative Name]

## 1. Document Control & Checkpoint Chain
- Initiative:
- Based on Checkpoints: `01-foundation.md`, `02-boundary.md` (verified)
- Date:

## 2. Definition of Done & Scenarios (Phase J)
- Output Complete:
- Capability Ready:
- Outcome Evidenced:
- Transition Complete:
- End-to-End Acceptance Scenario:
- Edge & Failure Scenarios:

## 3. Governance and Change (Phase K)
- Accountable Decision-Maker:
- Escalation Route:
- Scope Change Criteria:
- Change Record Destination:

## 4. Handoff Readiness (Phase L)
- Receiving Discipline / Protocol:
- Ready Inputs:
- Remaining Prerequisites:
- Next Responsible Action: [Exactly one action]
- Accountable Action Owner: [Single named role]

## 5. Gate Log & Evaluations (C9)
| Gate | Type (Baseline/Conditional) | Status (Pass/Fail) | Evidence / Basis | Action Taken |
| --- | --- | --- | --- | --- |
| Gate A: Evidence Coverage | Baseline | Pass | [...] | [...] |
| Gate B: Real Example Walkthrough | Baseline | Pass | [...] | [...] |
| Gate C: Internal Consistency | Baseline | Pass | [...] | [...] |
| Gate D: Open-Item Integrity | Baseline | Pass | [...] | [...] |
| Gate E: Proportionality | Baseline | Pass | [...] | [...] |
| Gate [F–J if applicable] | Conditional | Pass | [...] | [...] |

## 6. Boundary / Foundation Amendments (if any)
- [Amendments made to earlier checkpoints during gate testing]

## 7. C12 Decision Records: Milestone Close-Out
| Decision | Rationale | Alternatives Considered & Rejected | Owner | Date |
| --- | --- | --- | --- | --- |

## 8. Milestone Transition
- Status: Readiness & Gates complete
- Next phase: steps/04-synthesis.md
- Blocking item: [none | specific blocking item]
```

### Verification Rule
After writing `<initiative-slug>-scope/03-readiness.md`, re-read the file with your tool to confirm host persistence before proceeding.

---

## 5. Checkable Step Completion Criteria (C6)

Do not advance to Step 04 until all items are observable in `03-readiness.md`:
- [ ] Definition of Done specified across Output, Capability, Outcome, and Transition.
- [ ] At least one concrete End-to-End Acceptance Scenario and one Edge/Failure Scenario written out.
- [ ] Next responsible action has exactly ONE named action and ONE accountable role owner.
- [ ] Gate Log contains evaluations for all 5 Baseline Gates (A–E) plus any triggered Conditional Gates (F–J); all show Pass.
- [ ] Section 7 C12 Decision Records table is populated with close-out records for this milestone.
- [ ] File verified on disk via re-read.
- [ ] `Next phase: steps/04-synthesis.md` structured pointer present.
