# Step 01: Foundation (Phases A–D)

**Phase:** Problem Frame, Stakeholders, Outcomes, and Domain Model  
**Inputs:** Completed Step 00 intake & fit gate record  
**Checkpoint Produced:** `<initiative-slug>-scope/01-foundation.md`  
**Next Step:** `protocols/comprehensive/steps/02-boundary.md`

---

## 1. Operating Rules for This Step

- **Questioning cadence (C2):** Ask ONE question at a time. Each question carries a recommended answer grounded in available evidence. Never batch.
- **Anti-sycophancy (C1):** Ban validation fluff. Distinguish facts from uninspected assumptions.
- **Traceability tagging (C7):** Tag every load-bearing claim with its intake or evidence source (e.g., `(intake Q1)` or `(evidence: architecture-overview.md#L42)`).

---

## 2. Core Mapping Cycle: Phases A–D

### Phase A — Intent and Current Reality
Clarify the current state and trigger before proposing solutions.
1. **Triggering Situation:** What happened that made this an issue now?
2. **Current Reality:** What happens today? What are the workarounds, friction, costs, or risks?
3. **Inaction Consequence:** What happens if nothing changes over the next 6–12 months?
4. **Desired Future Condition:** What observable state exists after this initiative succeeds?
5. **Phase A Test:** Can an outsider understand the problem and needed change without being shown the proposed solution?

### Phase B — People, Roles, and Impact
Identify affected human roles; never accept "everyone" as a stakeholder.
1. **Primary Beneficiary:** The single role that receives primary value.
2. **Accountable Sponsor:** The role holding authority and resource responsibility.
3. **Direct Users / Operators:** Who operates, uses, or maintains the result?
4. **Affected / Burdened Parties:** Who bears costs, disruption, workflow changes, or data capture burden?

### Phase C — Outcomes, Value, and Guardrails
Construct the outcome chain:
```
Current Condition ──> Intervention / Outputs ──> Near-Term Outcomes ──> Longer-Term Impact
```
1. **Primary Outcomes:** Observable changes in real-world behavior or system performance.
2. **Success Signals:** Concrete indicators that prove outcomes occurred (baseline comparison where known).
3. **Guardrails:** Metrics, standards, or conditions that must NOT worsen.
4. **Anti-Goals:** Explicit outcomes this work is forbidden to optimize for.
5. **Stop / Pivot Triggers:** Evidence conditions that signal the initiative should halt or change course.

### Phase D — Domain Model and Vocabulary
Map critical terms and prevent mechanism-shaped ambiguity:
1. **Core Domain Vocabulary:** Key recurring nouns, states, events, or units.
2. **Mechanism-Shaped Words Watch:** If words like *automatic*, *personalized*, *secure*, *accessible*, *real-time*, or *compliant* are used, identify the explicit rule or standard that defines them. If the rule is not settled, label the claim as a **Working Assumption** or **Open Item**.

---

## 3. Register Classifications

Classify all foundational items into standard register states:
- **Confirmed — Decision:** Authorized choice with rationale and owner.
- **Confirmed — Verified Fact:** Claim backed by verified evidence.
- **Working Assumption:** Assumed true for now, with *impact if wrong* and *validation plan*.
- **Open — Decision / Verification:** Unresolved item with named owner and trigger.
- **Deferred:** Postponed with explicit rationale.
- **Excluded:** Deliberately outside foundational scope.

---

## 4. Checkpoint Creation: `01-foundation.md`

Once Phases A–D are coherent, write `<initiative-slug>-scope/01-foundation.md`.

### Structure of `01-foundation.md`:
```markdown
# Checkpoint 01: Foundation — [Initiative Name]

## 1. Document Control & Context
- Initiative:
- Operating Surface: [Durable | Degraded]
- Starting Condition & Work Shape:
- Source Evidence Tag:
- Prepared Date:

## 2. Intent and Current Reality (Phase A)
- Trigger:
- Current Reality & Friction:
- Consequence of Inaction:
- Desired Future Condition:

## 3. People, Roles, and Impact (Phase B)
- Primary Beneficiary: [Named role] (source tag)
- Accountable Sponsor: [Named role] (source tag)
- Material Stakeholders & Impact:

## 4. Outcomes and Guardrails (Phase C)
- Outcome Chain:
- Success Measures:
- Guardrail Measures:
- Anti-Goals:
- Pivot / Stop Signals:

## 5. Domain Model & Vocabulary (Phase D)
| Term | Operational Meaning | Boundary Rule | Source Tag |
| --- | --- | --- | --- |

## 6. Active Assumptions & Open Foundational Items
| Item | Class | Confidence / Impact if Wrong | Validation Plan | Owner |
| --- | --- | --- | --- | --- |

## 7. C12 Decision Records: Milestone Close-Out
| Decision | Rationale | Alternatives Considered & Rejected | Owner | Date |
| --- | --- | --- | --- | --- |

## 8. Milestone Transition
- Status: Foundation complete
- Next phase: steps/02-boundary.md
- Blocking item: [none | specific blocking dependency]
```

### Verification Rule
After writing `<initiative-slug>-scope/01-foundation.md`, re-read the file with your tool to confirm host persistence before proceeding.

---

## 5. Checkable Step Completion Criteria (C6)

Do not advance to Step 02 until all items are observable in `01-foundation.md`:
- [ ] Primary beneficiary and accountable sponsor named as specific roles, not vague groups.
- [ ] Current reality and desired future condition written in observable, solution-independent language.
- [ ] Outcome chain includes at least one success signal, one guardrail, and one anti-goal.
- [ ] Domain vocabulary defines mechanism-shaped words with operational rules or flags them as open.
- [ ] Every major claim carries an intake/evidence source tag (C7).
- [ ] Section 7 C12 Decision Records table is populated with at least one record (or explicit "None required").
- [ ] Checkpoint file written to disk and verified via re-read.
- [ ] `Next phase: steps/02-boundary.md` structured pointer present.
