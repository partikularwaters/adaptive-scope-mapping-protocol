# Checkpoint 01: Foundation — Community Vaccination Outreach Redesign

## 1. Document Control & Context
- Initiative: Community Vaccination Outreach Redesign
- Operating Surface: Durable
- Starting Condition & Work Shape: Evolving / Service & Operations
- Source Evidence Tag: (evidence: 2024 retrospective memo, partner complaints 2026-06)
- Prepared Date: 2026-07-26

## 2. Intent and Current Reality (Phase A)
- Trigger: Post-pandemic funding requires demonstrable outreach outcomes by FY2027; partner clinics threatened withdrawal over duplicate contacts.
- Current Reality & Friction: Fragmented scheduling across phone, paper, and 3 disparate systems; partner lists sent via fax; no single view of resident status.
- Consequence of Inaction: Continued duplicate outreach, partner attrition, missed funding targets, and persistent gaps for homebound seniors.
- Desired Future Condition: Unified single intake path, shared status between staff and partners, automated cadence rules, segmented reporting without manual spreadsheets.

## 3. People, Roles, and Impact (Phase B)
- Primary Beneficiary: Seniors and homebound residents in underserved ZIP codes who are eligible but not yet vaccinated (intake Q2)
- Accountable Sponsor: Dr. Amara Okafor, Public Health Programs Director (intake Q2)
- Material Stakeholders & Impact:
  - Outreach staff (12 FTE): High operational influence; burdened by duplicate manual data entry.
  - Community clinic partners (6): Can block adoption; require simplified lists without conflict.
  - County IT: Gate for HIPAA alignment and technical integration.
  - County Board: Approves major spend above $50k.

## 4. Outcomes and Guardrails (Phase C)
- Outcome Chain: Fragmented intake → unified intake + shared status → fewer missed follow-ups → higher completed vaccination series in target populations.
- Success Measures: Completed series rate in pilot ZIPs (baseline: 42% - working assumption); partner-reported duplicate contact incidents (<3/week); staff overtime hours.
- Guardrail Measures: Zero privacy incidents; outreach staff voluntary turnover must not exceed trailing 12-month average.
- Anti-Goals: Maximizing call volume without completion; replacing clinical judgment with automated rules.
- Pivot / Stop Signals: Partner adoption below 4 of 6 clinics at 90 days; IT integration estimate exceeds budget envelope.

## 5. Domain Model & Vocabulary (Phase D)
| Term | Operational Meaning | Boundary Rule | Source Tag |
| --- | --- | --- | --- |
| Completed series | All doses in recommended sequence recorded in immunization registry | Distinct from "scheduled" or "single dose" | State registry definition, checked 2026-07-20 |
| Outreach attempt | Documented contact try via approved channel | Phone, home visit, partner referral | Confirmed — Decision |
| Unified intake | Single resident record created once, visible to authorized roles | Excludes clinical triage decisions | Working Assumption |

## 6. Active Assumptions & Open Foundational Items
| Item | Class | Confidence / Impact if Wrong | Validation Plan | Owner |
| --- | --- | --- | --- | --- |
| 42% baseline completion rate is accurate | Working Assumption | Medium / Target metrics mis-set | Analytics data pull by 2026-08-05 | Data Team Lead |
| Unified intake architecture approved by IT | Working Assumption | High / Delays implementation | IT design review | County IT Lead |

## 7. C12 Decision Records: Milestone Close-Out
| Decision | Rationale | Alternatives Considered & Rejected | Owner | Date |
| --- | --- | --- | --- | --- |
| Scope focused on service operations, not clinical protocols | Clinical rules are governed by state/federal bodies and not the bottleneck | Attempting to redesign clinical eligibility | Dr. Amara Okafor | 2026-07-26 |
| Prioritize homebound seniors over broad general population | Highest disparity and greatest risk of severe outcome | Broad county-wide advertising campaign | Dr. Amara Okafor | 2026-07-26 |

## 8. Milestone Transition
- Status: Foundation complete
- Next phase: steps/02-boundary.md
- Blocking item: none
