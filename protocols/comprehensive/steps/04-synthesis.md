# Step 04: Synthesis (`IDEA-SCOPE.md`)

**Phase:** Synthesis, Invariant Verification, and Handoff Artifact Approval  
**Inputs:** Completed and verified checkpoints (`01-foundation.md`, `02-boundary.md`, `03-readiness.md`)  
**Output Produced:** `IDEA-SCOPE.md` (Canonical Scope Map)  
**Governing Standard:** C10 Non-Negotiable Invariants & C11 Stranger-Agent Handoff Bar

---

## 1. Governing Principle: The Stranger-Agent Handoff Bar (C11)

The synthesis passes if and only if:
> **An agent that never saw the conversation can execute the handoff from `IDEA-SCOPE.md` alone, without guessing intent, resolving contradictions, or relying on unwritten conversational history.**

Every load-bearing choice, boundary, constraint, scenario, and handoff prerequisite must be fully self-contained in the document.

---

## 2. Mandatory Synthesis Invariants (C10)

Before generating `IDEA-SCOPE.md`, verify that the synthesis satisfies these five non-negotiable invariants:
1. **Out-of-Scope Section Present & Non-Empty:** Section 6 must explicitly record excluded deliverables, behaviors, or parked sibling initiatives (with rationale).
2. **Assumptions Labeled as Assumptions:** Section 9 must explicitly table every load-bearing assumption with confidence, *impact if wrong*, and a concrete validation plan. No assumption may masquerade as a fact.
3. **Exactly One Named Next Action:** Section 18 must state exactly ONE immediate next responsible action, assigned to ONE accountable role owner.
4. **Change Trigger Stated:** Section 0 and Section 14 must state what specific evidence or event permits the scope to be reopened, altered, or paused.
5. **Surviving Decisions Logged in Section 15:** Section 15 (Decision Register) must include the load-bearing decisions captured in the C12 close-out sections of checkpoints 01, 02, and 03.

---

## 3. Checkpoint Consolidation Rules

1. **Synthesize, do not concatenate:** Integrate the verified state from `01-foundation.md`, `02-boundary.md`, and `03-readiness.md`. Resolve amendments recorded in later checkpoints into their corresponding sections.
2. **Traceability preserved:** Maintain source tags on key claims, outcomes, and constraints.
3. **No placeholders:** Do not leave `[TBD]`, `[TODO]`, or unpopulated bracketed text in a document marked `Decision-ready`.
4. **Checkpoints remain historical record:** Once approved, `IDEA-SCOPE.md` is the canonical origin scope; the checkpoint files remain supporting working history.

---

## 4. Canonical Synthesis Contract

Generate the complete document saved as **`IDEA-SCOPE.md`** at the initiative root (or runtime project root):

```markdown
# Scope Map — [Initiative Name]

## 0. Document Control
- Status: Draft | Decision-ready | Approved | Superseded
- Version: v0.2.0-draft
- Scoping mechanism: ASMP Comprehensive (Stepped)
- Operating surface: Durable
- Primary direction: [New | Evolving | Replacing | Investigating | Recovering | Retiring]
- Work shape: [Primary lens and any secondary lenses]
- Scope owner: [Accountable person or role]
- Accountable decision-maker: [Named role]
- Prepared on: [Date]
- Evidence current through: [Date]
- Next review or change trigger: [Specific event or milestone]

## 1. Executive Frame
[One paragraph explaining what is changing, for whom, why now, and what success means]
- Primary beneficiary: [Named role]
- Accountable sponsor: [Named role]
- Minimum acceptable result: [Crisp observable baseline]
- Principal boundary: [Single defining boundary statement]

## 2. Current Reality and Intent
### Current state
[What happens today, friction, workarounds, and prior attempts]
### Trigger and urgency
[Why action is being taken now]
### Desired future condition
[Observable future state in solution-independent terms]
### Consequence of no action
[What worsens if nothing changes over 6–12 months]

## 3. People, Roles, and Impact
[Stakeholder roles, needs, influence, burdens, access considerations, and conflicts]

## 4. Outcomes and Guardrails
### Outcome chain
[Current Condition ──> Intervention ──> Outputs ──> Outcomes ──> Impact]
### Success measures and baseline
[Observable metrics with baseline comparison where available]
### Guardrail measures
[Conditions or metrics that must not degrade]
### Anti-goals
[Outcomes explicitly forbidden to optimize for]
### Stop, pivot, or reconsider signals
[Observable indicators triggering project re-evaluation]

## 5. Domain Model and Vocabulary
| Term | Operational Meaning | Boundary Rule | Source Tag |
| --- | --- | --- | --- |

## 6. Scope and Boundaries
### In scope
[Committed deliverables, behaviors, data, integrations, and operational readiness]
### Conditional
[Items included only upon fulfillment of named triggers]
### Out of scope (Mandatory Invariant — C10)
[Explicitly excluded deliverables, deferred extensions, and parked sibling initiatives]
### External dependencies and interfaces
[Required capabilities owned outside this scope]

## 7. Sequence
### [Stage Name: e.g. Prototype / Pilot / Launch]
- Purpose:
- Included:
- Entry conditions:
- Exit evidence:
- Dependencies:
- Non-goals:

## 8. Constraints and Operating Context
| Constraint | Class (Hard/Negotiable) | Basis & Origin Tag | Consequence if Breached | Owner |
| --- | --- | --- | --- | --- |

## 9. Assumptions (Mandatory Invariant — C10)
| Assumption | Confidence | Impact if Wrong | Validation Plan | Owner / Due |
| --- | --- | --- | --- | --- |

## 10. Dependencies
| Dependency | Provider | Needed by | Status | Fallback / Consequence | Owner |
| --- | --- | --- | --- | --- | --- |

## 11. Risks and Responses
| Cause → Event → Consequence | Likelihood | Impact | Early Signal | Response Plan | Owner |
| --- | --- | --- | --- | --- | --- |

## 12. Approach Boundaries
[Settled boundaries that shape feasibility, compliance, or outcomes without micro-designing code]

## 13. Definition of Done and Acceptance
### Output complete
### Capability ready
### Outcome evidenced
### Transition complete
### End-to-end acceptance scenario
[Given starting condition X, actor Y executes realistic workflow Z, achieving outcome W verified by evidence E]
### Edge and failure scenarios
[Realistic stress or failure case verifying graceful recovery]

## 14. Governance and Change
- Decision rights: [Named roles with scope change authority]
- Consultation and escalation path:
- Review cadence or decision gates:
- Change criteria and record location: [What permits scope adjustment]

## 15. Decision Register (C12 Surviving Decisions)
| Decision | State | Rationale or Evidence | Owner | Date | Revisit Trigger |
| --- | --- | --- | --- | --- | --- |

## 16. Open and Deferred Items
| Item | State | What is Needed | Owner | Due Date or Trigger | Blocks |
| --- | --- | --- | --- | --- | --- |

## 17. Gate Log
| Gate | Type | Result | Evidence Used | Action Taken |
| --- | --- | --- | --- | --- |
| Gate A: Evidence Coverage | Baseline | Pass | Checkpoint 01 & attachments | Verified all sources tagged |
| Gate B: Real Example Walkthrough | Baseline | Pass | Section 13 scenario | End-to-end flow validated |
| Gate C: Internal Consistency | Baseline | Pass | Cross-checkpoint check | Zero terminology or scope conflicts |
| Gate D: Open-Item Integrity | Baseline | Pass | Section 16 inspection | Zero ownerless open items |
| Gate E: Proportionality | Baseline | Pass | Synthesis review | Balanced detail without ceremony |

## 18. Handoff
- Receiving discipline or protocol: [e.g. Technical Architecture / Implementation Planning]
- Ready inputs: [Completed IDEA-SCOPE.md, repositories, test assets]
- Remaining prerequisites: [Any unblockers]
- Next responsible action (Mandatory Invariant — C10): [Exactly ONE concrete next action]
- Accountable action owner: [Single named role]
- Expected output of next stage: [Deliverable of next discipline]

## Appendix A — Evidence Register
| Artifact or Source | Date / Version | Relevance | Reliability / Limitation | Claims Supported |
| --- | --- | --- | --- | --- |
```

---

## 5. Optional Handoff Adapters

When handing off to a specific discipline, append the corresponding specialized section before final sign-off:
- **Research Adapter:** Research question, sampling logic, ethics, validity threats.
- **Design Adapter:** Experience principles, prototype fidelity, design acceptance criteria.
- **Operations / Service Adapter:** Service blueprint boundary, staffing, SLA, exception handling.
- **Policy / Governance Adapter:** Authority, jurisdiction, enforcement, sunset criteria.
- **Creative / Production Adapter:** Medium, creative references, clearances, distribution.
- **Physical / Hardware Adapter:** Materials, dimensions, logistics, setup/teardown, safety.

---

## 6. Closing the Scoping Session

1. Present `IDEA-SCOPE.md` to the accountable sponsor.
2. Review the **C10 Invariants** and run the **C11 Stranger-Agent Handoff test** with the user.
3. Obtain explicit approval or specific line corrections.
4. Once approved, mark `Status: Approved` and instruct:
   > *"IDEA-SCOPE.md is decision-ready for [Next Stage]. It preserves the current intent, boundaries, evidence, uncertainty, and handoff conditions. Future changes should follow the governance rules in Section 14."*
