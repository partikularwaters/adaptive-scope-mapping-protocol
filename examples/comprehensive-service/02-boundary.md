# Checkpoint 02: Boundary — Community Vaccination Outreach Redesign

## 1. Document Control & Upstream Checkpoint
- Initiative: Community Vaccination Outreach Redesign
- Based on Checkpoint: `01-foundation.md` (verified)
- Date: 2026-07-27

## 2. Scope Boundaries (Phase E)
### In Scope
- Unified intake workflow and staff/partner views (intake Q1)
- Follow-up cadence rules and queue management (intake Q1)
- Reporting for pilot ZIP outcomes and operational load (intake Q2)
- Training and rollout for outreach staff and partners (intake Q2)
- Privacy impact assessment (PIA) update for changed data flows (evidence: County Legal policy)

### Conditional Scope
- SMS reminders — Condition: Legal review approves template and opt-out flow by 2026-09-01

### Out of Scope & Parked Initiatives (C8 Splitting Rule)
- Changes to clinical eligibility guidelines — Reason: External statutory authority
- Replacement of county immunization registry — Reason: Out of scope state infrastructure
- General public marketing campaign — Reason: Parked per C8; separate communications initiative

### External Dependencies & Handoff Interfaces
- State immunization registry API — Provider: County IT / State Health
- Partner clinic scheduling systems — Provider: 6 community clinics (daily secure export fallback)

## 3. Sequence and Staging (Phase F)
- Model: Explore / Pilot / Scale
- Stage Breakdown:
  - Phase 1 (Now): Pilot design and partner commit | Entry: Approved scope | Exit Evidence: 4+ partners signed MOU addendum; baseline report accepted | Non-Goals: County-wide rollout
  - Phase 2 (Next): Build and pilot in two ZIP codes | Entry: Phase 1 exit evidence | Exit Evidence: 90-day pilot report against success metrics | Non-Goals: Scaling beyond pilot ZIPs
  - Phase 3 (Later): Scale or pivot decision | Entry: 90-day pilot evaluation | Exit Evidence: Board decision on county-wide expansion

## 4. Constraints and Operating Context (Phase G)
| Constraint | Class (Hard/Negotiable) | Basis & Origin Tag | Consequence if Breached | Owner |
| --- | --- | --- | --- | --- |
| HIPAA compliance for all resident data | Hard | Federal & state privacy law | Work invalid/illegal if violated | County Privacy Officer |
| Budget ceiling $380k for Phases 1–2 | Hard | Board resolution 2026-04 | Scope must shrink or phase | Amara Okafor |
| Partner tools cost ceiling <$5k/site | Negotiable | Partner feedback | May limit direct integration depth | Amara Okafor |
| Bilingual support (English/Spanish) | Hard | County language access policy | Required for pilot rollout | Program Lead |

## 5. Assumptions, Dependencies, and Risks (Phase H)
### Assumptions Register
| Assumption | Confidence | Impact if Wrong | Test / Validation Method | Owner / Due |
| --- | --- | --- | --- | --- |
| Registry API can support daily sync | Medium | Reverts to manual reconciliation | IT spike with sample load | County IT / 2026-08-15 |

### Dependencies Register
| Dependency | Provider | Needed By | Status | Fallback Plan | Owner |
| --- | --- | --- | --- | --- | --- |
| Legal PIA review | County Counsel | Phase 2 build | Scheduled Aug 2026 | Delay pilot start | Privacy Officer |
| Partner MOU addenda | Clinic Leads | Phase 1 exit | 3 of 6 signed | Reduce pilot geography | Amara Okafor |

### Risks Register
| Risk (Cause → Event → Consequence) | Likelihood | Impact | Early Warning Signal | Response Plan | Owner |
| --- | --- | --- | --- | --- | --- |
| Partner non-adoption → duplicate outreach persists → pilot fails | Medium | High | <4 partners signed at 60 days | Simplify export format; executive outreach | Amara Okafor |
| Staff resistance → shadow spreadsheets reappear | Medium | Medium | Inconsistent queue usage | Co-design sessions; reduce entry fields | Program Lead |

## 6. Approach Boundaries (Phase I)
- Must support offline-capable home visit logging (field connectivity in mobile clinics is unreliable).
- Specific CRM/tool procurement deferred to standard RFP process unless only one HIPAA-compliant option exists.

## 7. Foundation Amendments (if any)
- Added specific requirement for offline-capable logging following mobile nurse consultation.

## 8. C12 Decision Records: Milestone Close-Out
| Decision | Rationale | Alternatives Considered & Rejected | Owner | Date |
| --- | --- | --- | --- | --- |
| Scope pilot strictly to two ZIP codes | Manage operational risk and partner onboarding bandwidth | County-wide launch across all 12 ZIP codes | Amara Okafor | 2026-07-27 |
| Allow daily secure file export fallback for clinic partners | Heterogeneous partner IT systems cannot all build API integrations by Phase 2 | Mandating live API integration for all partners (would cause partner dropouts) | County IT / Amara | 2026-07-27 |

## 9. Milestone Transition
- Status: Boundary complete
- Next phase: steps/03-readiness.md
- Blocking item: none
