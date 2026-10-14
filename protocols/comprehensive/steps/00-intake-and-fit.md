# Step 00: Intake & Fit Gate

**Phase:** Intake, Evidence Gathering, Operating Surface Assessment, and Scored Fit Gate  
**Inputs:** Initial user prompt, relevant project documents/code/notes  
**Outputs:** Intake record, Operating Surface classification, Scored Fit rubric, track confirmation  
**Next Step:** `protocols/comprehensive/steps/01-foundation.md`

---

## 1. Intake Questioning Discipline (C2)

**Never batch questions.** Ask exactly ONE question at a time.  
Every question must include an evidence-grounded recommended answer so the person reacts rather than drafting from scratch.

### Questioning Cadence
1. Formulate one clear question based on current intake evidence.
2. Pair it with your recommended read / default hypothesis:
   > *"Question... From what you've provided so far, my read is [recommended answer]. Does that match reality, or is it different?"*
3. Stop and wait for the response. Do not add follow-ups in the same turn.
4. If the answer is vague or polished without substance, drill down on that same question before proceeding.

---

## 2. Opening Intake Sequence

### Question 1: Existing Evidence & Artifacts
Start here:
> *"What already exists that could help us understand this initiative — documents, specs, repositories, sketches, customer feedback, prior attempts, or metrics?  
> My recommended assumption: there is existing context or prior discussion in this project space. Please share paths, links, or text snippets, or confirm if we are starting completely from a blank slate."*

### Question 2: Starting Condition & Shape
Determine the primary trajectory:
- **Starting Condition:** New | Evolving | Replacing | Investigating | Recovering | Retiring
- **Primary Shape:** Product/Platform | Service/Customer Experience | Research/Evaluation | Design/Creative | Process/Operations | Policy/Governance | Program/Event | Physical/Infrastructure | Mixed

> *"What is the starting condition and primary shape of this work?  
> My recommended read based on your intro is [Condition: e.g. Evolving] and [Shape: e.g. Process/Operations]. Am I right, or does this have a different starting condition?"*

### Question 3: Demand Reality Probe (C3)
Probe whether real demand exists before accepting importance assertions:
> *"What is the strongest evidence someone would be genuinely upset if this vanished tomorrow?  
> From what you've shared so far, the strongest demand evidence appears to be [specific behavior / metric / painful incident]. Is that real, or is there something stronger?"*

*(Anti-Sycophancy Check — C1: If the answer cites a waitlist, polite enthusiasm, or hypothetical interest, state plainly that this is weak evidence and note it as a Working Assumption, not verified demand).*

---

## 3. Evidence Handling Rules

1. **Inspect before asking:** If files or artifacts exist in the repository or session, read them before asking the person to repeat their contents.
2. **Tag sources:** Record artifact name, version/date, and reliability.
3. **Protect source materials:** Never overwrite existing project source documents during scoping. Quote or summarize, but do not alter them without separate authorization.

---

## 4. Scored Fit and Redirection Gate (C4 & C5)

Once intake questions 1–3 are answered, evaluate fit before committing to the Comprehensive mapping cycle.

### 4.1 Operating Surface Check
Determine the runtime environment:
- **Durable:** Host-verifiable persistent file read/write (e.g., local project workspace with tool access). Checkpoints can be saved and verified.
- **Degraded-Artifact:** Can generate a downloadable file, but cross-session persistence is not host-verifiable.
- **Degraded-Packet:** Ephemeral chat surface with no file operations. Continuity depends on copy-pasting.

*Rule:* If the surface is Degraded-Artifact or Degraded-Packet, either redirect to ASMP Compact or switch to `protocols/comprehensive/PORTABLE.md`.

### 4.2 Scored Fit Rubric (C4)
Fill out and display this scored rubric to the person:

| Dimension | Description | Score (0–10) | Evidence / Basis |
| --- | --- | :---: | --- |
| **1. Business Objectives Clarity** | How clearly defined and grounded is the core purpose? (0 = vague idea, 10 = quantified, verifiable intent) | `[0–10]` | `[Evidence]` |
| **2. Acceptance Criteria** | How observable are the conditions of satisfaction? (0 = undefined feelings, 10 = testable scenarios) | `[0–10]` | `[Evidence]` |
| **3. Constraints & Operating Context** | Are hard technical, financial, or regulatory limits known? (0 = uninspected, 10 = verified limits) | `[0–10]` | `[Evidence]` |
| **4. Problem Ambiguity & Novelty** | Level of problem clarity (0 = highly speculative / unknown problem space, 10 = well-bounded problem space) | `[0–10]` | `[Evidence]` |
| **5. Scope Boundedness** | How well-contained are the deliverables? (0 = unbounded program/wishlist, 10 = crisp single-system boundary) | `[0–10]` | `[Evidence]` |
| **6. Interdependence & Stakeholders** | Coordination complexity (0 = many conflicting multi-org parties, 10 = single aligned owner/system) | `[0–10]` | `[Evidence]` |
| **Total Score** | | `[Sum / 60]` | *(Normalized to 100)*: `[Score]` |

### 4.3 Routing Thresholds
- **Score ≥ 70 / 100:** Proceed with **ASMP Comprehensive**. The initiative has sufficient definition and complexity to warrant full phased mapping.
- **Score 40–69 / 100:**
  - If low score is due to small, self-contained scope: recommend redirecting to **ASMP Compact**.
  - If low score is due to missing evidence or ambiguity: run ONE round of clarifying questions, then re-score.
- **Score < 40 / 100:** **Redirect.** The work is not ready for scoping; it requires fundamental discovery, executive decision, or research first.

### 4.4 Record Track Selection Rationale (C5)
State the decision and record a one-line rationale:
> *"Gate Decision: [Comprehensive | Compact | Redirect] (Score: [X]/100).  
> Rationale: [One-line justification grounded in consequence, coordination, and reversibility]."*

### 4.5 Redirection Procedure (if applicable)
If redirecting away from Comprehensive:
1. Explain the specific mismatch evidence.
2. Recommend the proportionate path (Compact or Discovery/Research).
3. Outline what gathered information carries forward.
4. Obtain explicit user approval before changing tracks.

---

## 5. Checkable Step Completion Criteria (C6)

Do not advance to Step 01 until every box is verified by looking at the record:
- [ ] Primary starting condition and shape explicitly identified.
- [ ] Initial evidence inspected or unavailability noted.
- [ ] Demand Reality probe answered and evaluated with anti-sycophancy posture.
- [ ] Operating Surface verified as **Durable** (or user confirmed degraded execution).
- [ ] Scored Fit Rubric completed with numeric values and displayed to the user.
- [ ] One-line track-selection rationale recorded on the record.
- [ ] Person confirmed agreement with the gate outcome.

---

## 6. Milestone Hand-off

Create the initiative directory `<initiative-slug>-scope/` if it does not already exist.

Record in memory:
- `Next phase: steps/01-foundation.md`
- `Blocking item: none`

Proceed to load `protocols/comprehensive/steps/01-foundation.md`.
