# Scope Map — Community Vaccination Outreach Redesign

## 0. Document Control
- Status: Decision-ready
- Scoping mechanism: ASMP Comprehensive
- Primary direction: Evolving
- Work shape: Service or customer experience (primary); process, operations, or organizational change (secondary)
- Scope owner: Dr. Amara Okafor, Public Health Programs Director
- Accountable decision-maker: Amara Okafor (operational); County Board approval required for budget changes above $50k
- Prepared on: 2026-07-28
- Evidence current through: 2026-07-25
- Next review or change trigger: Pilot results from Phase 1 or material change in state funding rules

## 1. Executive Frame
Riverside County's mobile vaccination outreach reaches fewer seniors and homebound residents than planned because scheduling, follow-up, and community partner coordination are fragmented across phone, paper, and three separate systems. This scope covers redesigning the outreach **service** for the next 18 months: unified intake, partner handoffs, follow-up cadence, and measurable reach — not a new clinical protocol. Success means measurably higher completed vaccination series among targeted populations without increasing staff burnout or violating privacy rules.

- Primary beneficiary: Seniors and homebound residents in underserved ZIP codes who are eligible but not yet vaccinated
- Accountable sponsor: Dr. Amara Okafor
- Minimum acceptable result: 15% increase in completed series in two pilot ZIP codes vs. same period last year, with no increase in privacy incidents
- Principal boundary: Outreach operations and coordination — not reformulation of clinical guidelines

## 2. Current Reality and Intent
### Current state
Residents call a central line; staff log calls in a CRM, schedule visits in a separate calendar tool, and partners receive faxed lists. Follow-up is ad hoc. No single view of "attempted / scheduled / completed / declined."

### Trigger and urgency
Post-pandemic funding requires demonstrable outreach outcomes by FY2027. Two partner clinics threatened to withdraw due to duplicate outreach.

### Desired future condition
A resident or caregiver has one intake path; staff and partners see shared status; follow-up happens on a defined cadence; leadership can report reach and completion by segment without manual spreadsheet work.

### Consequence of no action
Continued duplicate outreach, partner attrition, missed funding targets, and persistent gaps for homebound populations.

### Prior attempts and lessons
2024 spreadsheet consolidation failed because partners would not adopt manual updates. Lesson: partner-facing workflow must be simpler than current fax process.

## 3. People, Roles, and Impact
| Group | Need / burden | Influence |
| --- | --- | --- |
| Target residents & caregivers | Accessible scheduling, language support, dignity in home visits | Low direct influence; high impact |
| Outreach staff (12 FTE) | Less duplicate data entry, clear daily queue | High operational influence |
| Community clinic partners (6) | Timely shared lists, no conflicting contact | Can block adoption |
| County IT | Sustainable integration, HIPAA alignment | Gate for technical choices |
| County Board | Outcome proof, budget discipline | Approves major spend |

Primary beneficiary: homebound and senior residents in target ZIP codes. Accountable sponsor: Amara Okafor.

## 4. Outcomes and Guardrails
### Outcome chain
Fragmented intake → unified intake + shared status → fewer missed follow-ups → higher completed vaccination series in target populations

### Success measures and baseline
- Completed series rate in pilot ZIPs (baseline: 42% of eligible contacted last year — **Working Assumption** pending validated baseline pull)
- Partner-reported duplicate contact incidents (baseline: ~3/week reported informally)
- Staff overtime hours during outreach weeks

### Guardrail measures
- Privacy incidents: must remain zero
- Staff voluntary turnover in outreach team: must not increase vs. trailing 12-month average

### Anti-goals
- Maximizing call volume without completion
- Replacing clinical judgment with automated exclusion rules

### Stop, pivot, or reconsider signals
Partner adoption below 4 of 6 after 90-day pilot; IT integration estimate exceeds approved budget envelope

## 5. Domain Model and Vocabulary
| Term | Meaning | Boundary or example | State |
| --- | --- | --- | --- |
| Completed series | All doses in recommended sequence recorded in immunization registry | Distinct from "scheduled" or "single dose" | Confirmed — Verified Fact (state registry definition, checked 2026-07-20) |
| Outreach attempt | Documented contact try via approved channel | Phone, home visit, partner referral | Confirmed — Decision |
| Unified intake | Single resident record created once, visible to authorized roles | Excludes clinical triage decisions | Working Assumption until IT design review |

## 6. Scope and Boundaries
### In scope
- Unified intake workflow and staff/partner views
- Follow-up cadence rules and queue management
- Reporting for pilot ZIP outcomes and operational load
- Training and rollout for outreach staff and partners
- Privacy impact assessment update for changed data flows

### Conditional
- SMS reminders — included only if legal review approves template and opt-out flow by 2026-09-01

### Out of scope
- Changes to clinical eligibility guidelines
- Replacement of county immunization registry
- Marketing campaign to general public

### External dependencies and interfaces
- State immunization registry API — County IT — read/write boundaries TBD
- Partner clinic scheduling systems — heterogeneous; minimum viable is secure daily export if API unavailable

## 7. Sequence
### Phase 1 — Pilot design and partner commit (Now)
- Purpose: Secure partner agreement and validated baseline
- Included: Workflow design, PIA draft, baseline data pull
- Entry conditions: This scope approved
- Exit evidence: 4+ partners signed MOU addendum; baseline report accepted by Amara
- Dependencies: Legal review slot booked
- Non-goals: Full county rollout

### Phase 2 — Build and pilot in two ZIP codes (Next)
- Purpose: Operate redesigned service in controlled geography
- Exit evidence: 90-day pilot report against success measures

### Phase 3 — Scale or pivot decision (Later)
- Purpose: Board decision on county-wide funding based on pilot evidence

## 8. Constraints and Operating Context
| Constraint | Class | Basis | Consequence | Owner |
| --- | --- | --- | --- | --- |
| HIPAA compliance for all resident data | Hard | Federal/state law | Work invalid if violated | County Privacy Officer |
| Budget ceiling $380k for Phases 1–2 | Hard | Board resolution 2026-04 | Scope must shrink or phased | Amara Okafor |
| Partner tools must not require new licenses over $5k/site | Negotiable | Partner feedback | May limit integration depth | Amara Okafor |
| Bilingual support (English/Spanish) at intake | Hard | County language access policy | Required for pilot | Program lead |

## 9. Assumptions
| Assumption | Confidence | Impact if wrong | Validation | Owner / Due |
| --- | --- | --- | --- | --- |
| Registry API can support daily sync for pilot volume | Medium | Manual reconciliation load returns | IT spike with sample load | County IT / 2026-08-15 |
| 42% baseline completion rate is accurate | Medium | Targets mis-set | Data team validated pull | Analytics / 2026-08-05 |

## 10. Dependencies
| Dependency | Provider | Needed by | Status | Fallback / Consequence | Owner |
| --- | --- | --- | --- | --- | --- |
| Legal PIA review | County Counsel | Before Phase 2 build | Scheduled Aug 2026 | Delay pilot | Privacy Officer |
| Partner MOU addenda | Clinic leads | Phase 1 exit | 3 of 6 signed | Reduce pilot geography | Amara |

## 11. Risks and Responses
| Cause → Event → Consequence | Likelihood | Impact | Early signal | Response | Owner |
| --- | --- | --- | --- | --- | --- |
| Partner non-adoption → duplicate outreach continues → pilot fails | Medium | High | <4 partners at 60 days | Simplify partner export; executive escalation | Amara |
| Staff resistance → workarounds → data quality collapse | Medium | Medium | Shadow spreadsheets reappear | Co-design sessions; reduce entry burden | Program lead |

## 12. Approach Boundaries
- Must support offline-capable home visit logging (field connectivity is unreliable) — scope-level delivery constraint
- Specific CRM product selection deferred to procurement sub-process unless one option is only HIPAA-eligible choice

## 13. Definition of Done and Acceptance
### Output complete
Pilot workflow documented; staff trained; partner onboarding materials delivered

### Capability ready
Staff and partners operate pilot for 90 days without reverting to fax lists as primary coordination

### Outcome evidenced
Pilot report compares completion rate and duplicate incidents to baseline

### Transition complete
Board receives scale/pivot recommendation with open items explicit

### End-to-end acceptance scenario
Given a homebound resident referred by a partner clinic, outreach staff create one intake record, schedule a visit, complete vaccination series entries sync to registry, and follow-up tasks close automatically when series completes — observable in shared dashboard by program lead.

### Edge and failure scenarios
Resident declines further doses: status moves to "declined — documented reason" without deleting history; no further outreach tasks generated unless resident re-initiates.

## 14. Governance and Change
- Decision rights: Amara owns operational scope; Board owns budget step-ups
- Consultation and approval: Privacy Officer for data flows; Legal for SMS if pursued
- Escalation path: Amara → Deputy Director → Board
- Review cadence: Biweekly during pilot
- Change criteria: Material funding, legal, or partner adoption failure triggers scope review; changes logged in program change register

## 15. Decision Register
| Decision | State | Rationale or evidence | Owner | Date | Revisit trigger |
| --- | --- | --- | --- | --- | --- |
| Pilot limited to two ZIP codes | Confirmed — Decision | Manage risk and partner load | Amara | 2026-07-28 | Pilot success |

## 16. Open and Deferred Items
| Item | State | What is needed | Owner | Due or trigger | Blocks |
| --- | --- | --- | --- | --- | --- |
| SMS reminder legal approval | Open — Decision | Counsel sign-off | Privacy Officer | 2026-09-01 | SMS feature |
| Validated baseline completion rate | Open — Verification | Analytics query sign-off | Data team | 2026-08-05 | Target calibration |

## 17. Gate Log
| Gate | Evidence used | Result | Change made |
| --- | --- | --- | --- |
| B — Real-example walkthrough | Sample homebound referral from Clinic C | Passed with offline logging requirement added | Added approach boundary |
| G — Harm and exclusion | Privacy Officer consult | Passed with PIA update required | Added Phase 1 dependency |

## 18. Handoff
- Receiving discipline or protocol: Service design and procurement (Phase 1), then program implementation
- Ready inputs: Approved scope, stakeholder map, phased sequence, gate log
- Remaining prerequisites: Baseline verification, partner MOUs
- Next responsible action: Kick off Phase 1 workflow design workshops with staff and two anchor partners
- Owner: Amara Okafor
- Expected output of the next stage: Validated service blueprint and procurement requirements document

## Appendix A — Evidence Register
| Artifact or source | Date / Version | Relevance | Reliability / Limitation | Claims supported |
| --- | --- | --- | --- | --- |
| 2024 outreach retrospective memo | 2024-11 | Prior failure modes | Internal; single author | Partner adoption lesson |
| Partner complaint emails (redacted) | 2026-06 | Duplicate outreach signal | Anecdotal but consistent | Trigger urgency |
| State registry completion definition | 2026-07-20 | Metric definition | Authoritative | Completed series term |
