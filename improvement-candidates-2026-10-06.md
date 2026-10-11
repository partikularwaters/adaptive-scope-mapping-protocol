# ASMP improvement candidates — 2026-10-06

Mined from the 16-round repo-shape search (`repo-shape-search-2026-10-06.md`),
mapped onto ASMP's structure. Status per candidate: C10 ADOPTED
2026-10-06 (C11 merged into C10 as its governing principle); C12
under deliberation; all others remain CANDIDATES until Madrid says so.

ASMP structure referenced: Intake/Evidence → Fit and Redirection Gate
→ Core Mapping Cycle Phases A–L → checkpoints `01-foundation.md` /
`02-boundary.md` / `03-readiness.md` → completion gates A–E (+F–J
conditional) → `IDEA-SCOPE.md` synthesis.

---

## Intake and Evidence phases

### C1. Anti-sycophancy posture for the Specialist
- Source: garrytan/gstack `/office-hours`.
- Mechanism: banned sycophant phrases plus a falsifiability rule.
  Sycophancy is the model's lowest-effort response: validating every
  idea ("That's interesting," "That could work") instead of
  evaluating it. In scoping, that fills the scope with unexamined
  fluff the person never actually believed. The ban works at the
  token level: the agent cannot reach for the easy validation
  phrase, so it must produce something substantive instead. Paired
  rule: take a position on every answer and state what evidence
  would change it — converting unfalsifiable praise into falsifiable
  claims. Example banned phrases: "That's an interesting approach,"
  "You might want to consider...", "That could work."
- Mapping: hardens ASMP's existing "structured thinking partner"
  posture (inspect evidence, distinguish facts from assumptions) with
  explicit banned behaviors instead of aspirational prose.
- Fit note: directly serves ASMP's "honest about what is confirmed,
  assumed, open, and excluded" promise. Low cost, high leverage.

### C2. One question at a time, with a recommended answer
- Source: racecraft-lab grill-me ("ask the questions one at a time;
  for each question provide your recommended answer").
- Mechanism: intake questions asked singly, each paired with the
  agent's recommended answer for the person to react to. In practice
  with open-ended questions: ask ONE question, then stop and wait —
  never batch. Each question carries an evidence-grounded recommended
  answer, so the person reacts ("yes" / "no, it's X" / "close
  but...") instead of composing from scratch; open-ended does not
  mean unassisted. If the answer is polished or vague, drill down on
  the same question before moving on. Worked sketch: instead of
  batching "who is this for, what's the painful moment, what does
  success look like," the agent asks: "Who is this for, narrowly?
  From what you've said so far, my read is [specific role]. Am I
  right, or someone else?" — waits — records — then: "What's the
  painful moment, a recent real example? My guess from your docs is
  [X]. Close?" Batching gets shallow answers to the easiest
  questions; one-at-a-time forces depth per question while the
  recommended answer keeps it fast.
- Mapping: intake questioning discipline, especially for the Compact
  / portable chat path where there is no checkpoint system to fall
  back on.
- Fit note: keeps intake brisk on surfaces where long question
  batteries would stall the conversation.

### C3. Demand Reality evidence probe
- Source: garrytan/gstack `/office-hours` Q1.
- Mechanism: "strongest evidence someone would be genuinely upset if
  this vanished tomorrow" — not interest, not a waitlist; specific
  behavior.
- Delivery (C2 pattern): asked one at a time, never batched with
  other evidence probes, carrying the agent's recommended answer —
  its read of the strongest demand evidence from intake so far.
  Worked sketch: "What's the strongest evidence someone would be
  genuinely upset if this vanished tomorrow? From what you've told
  me, the best candidate is [X]. Is that real, or is there something
  stronger?" If the answer is a waitlist, polite interest, or
  hypotheticals, the probe fails openly (C1 posture: say so plainly,
  name what would count instead) and the agent drills down before
  moving on.
- Mapping: a concrete probe inside the Evidence phase for testing
  whether the initiative's stated importance is real.
- Fit note: ASMP already inspects evidence; this adds one sharp,
  reusable test for demand claims.

## Fit and Redirection Gate

### C4. Scored gate criteria
- Source: mohantyajitesh/aj_solution_architect_agent (70/100 quality
  threshold across six dimensions: business objectives, acceptance
  criteria, constraints, ambiguity, scope, dependencies; vague input
  gets clarifying questions, not guesses).
- Mechanism: the gate's pass/fail criteria are explicit and scored,
  not left to agent judgment alone.
- In practice: a small rubric the agent fills from intake evidence
  and shows the person. Six dimensions (objectives clarity,
  acceptance criteria, constraints, ambiguity, scope boundedness,
  dependencies), each scored 0-10. 70+: Comprehensive. 40-69:
  Compact, or one round of clarifying questions then re-score. Below
  40: redirect — the work is not ready for scoping; it needs research
  or a decision first. The score is always shown with the one-line
  rationale (C5), so the track choice is auditable. Kept as a plain
  table so it survives the portable path.
- Mapping: makes the Fit Gate's decision checkable. A borderline
  score routes to clarifying questions or to Compact rather than a
  vague "proceed."
- Fit note: the strongest structural upgrade candidate for the gate.
  Tension: scoring adds ceremony; the threshold must stay simple
  enough to survive the portable path.

### C5. Recorded track-selection rationale
- Source: adityauttama/stella-protocol (Grand Line vs East Blue
  chosen after idea mapping, with the choice stated).
- Mechanism: the depth choice is announced with its reason, on the
  record.
- Mapping: the Fit Gate already selects Compact vs Comprehensive;
  this adds the one-line rationale to the record so a later reader
  knows why this depth was chosen.

## Core Mapping Cycle (Phases A–L)

### C6. "Done when checkable by looking, never by feeling"
- Source: klmiing1229-a11y/scope (design rules).
- Mechanism: every phase's completion is stated as an observable
  check, not a feeling of done-ness.
- In practice: each phase ends with a checklist the agent verifies
  by reading the checkpoint file, never by judging. Worked sketch:
  instead of "phase complete when the foundation feels solid," the
  step file says: "Phase complete when: [ ] primary beneficiary
  named as a specific role, not a category; [ ] problem stated in
  one sentence; [ ] 3+ evidence items logged with sources." Every
  box must be checkable by looking at the file. An unchecked box
  blocks the phase — that is what makes the completion gates (C9)
  mechanical rather than judgment calls.
- Mapping: rewrite phase exit criteria across A–L as checkable
  statements. Becomes the acceptance test for each step file in the
  stepped structure.
- Fit note: pairs naturally with the steps approach — each step file
  carries its own done-check.

### C7. Bidirectional traceability: scope elements → evidence
- Source: wombatepiclandingstudio/ai waterfall-blueprint
  (Business Need → Requirement → Module → Spec → Test).
- Mechanism: every element in the scope traces back to the evidence
  or intake answer that justifies it; orphan elements are findings.
- In practice: every element in a checkpoint file carries its source
  tag, e.g. "Primary beneficiary: ward ops lead (intake Q2)" or
  "Constraint: must run on existing hardware (evidence: site-visit
  notes 2026-10-01)". Reading backward, any element with no tag is
  an orphan: it must be traced, re-labeled as an assumption, or cut.
  Reading forward, every evidence item should justify something;
  unused evidence is a prompt to ask why it was gathered. This is
  what makes "inspect evidence before recollection" auditable
  instead of aspirational. The cost is real (every element tagged),
  so this is Comprehensive-only; Compact keeps the lighter
  "assumptions labeled" rule.
- Mapping: strengthens the three checkpoint files — a checkpoint is
  complete only when its elements trace to evidence.
- Fit note: this is ASMP's "inspect available evidence before
  relying on recollection" made checkable. Higher rigor cost;
  probably Comprehensive-only.

### C8. The splitting rule for oversized initiatives
- Source: klmiing1229-a11y/scope ("a wish that is really two
  projects gets scoped as the first one").
- Mechanism: an explicit rule — when intake reveals multiple
  initiatives, scope the first and park the rest, rather than
  ballooning one scope.
- Mapping: boundary phases (E–I). Gives the Specialist a
  defensible, pre-authorized move instead of negotiating scope
  creep mid-cycle.

## Completion gates (A–E, +F–J conditional)

### C9. Blocking gate with explicit criteria and targeted return
- Source: darsoohoo/intake-bot (formal quality gate + blocking
  human-review STOP; on failure, re-run only the failing unit).
- Mechanism: each gate lists its pass/fail criteria; a failed gate
  returns to the specific phase, never restarts the cycle.
- Mapping: completion gates A–E. ASMP has the gates; this makes
  their criteria explicit and their failure mode surgical.
- Fit note: complements C6 — the done-checks become the gate
  criteria.

### C10. Non-negotiables baked into every synthesis — ADOPTED 2026-10-06
- Source: 3nitiLab/composable-business-os (invariants enforced in
  every generated spec: integer cents, UTC storage, confirm step
  before destructive actions, etc.).
- Governing principle (merged from C11): the synthesis passes only
  if an agent that never saw the conversation could execute the
  handoff from the document alone — the stranger-agent handoff bar.
  The checklist below is how that principle is tested.
- Mechanism: a small fixed set of invariants every IDEA-SCOPE.md
  must satisfy (e.g., out-of-scope section present, assumptions
  labeled as assumptions, one named next action, change trigger
  stated).
- Mapping: completion gates — the synthesis cannot pass unless the
  non-negotiables hold.
- Fit note: cheap, high-value. Turns "decision-ready" from an
  aspiration into a checklist.

## Synthesis (IDEA-SCOPE.md)

### C11. The stranger-agent handoff bar — MERGED into C10, 2026-10-06
- (Folded into C10 as its governing principle. Original source:
  doner21/pinen spec-driven-ecology: "the intake succeeds when the
  next agent can act from the generated spec without needing to
  guess the human's intent or rely on hidden conversation history.")

### C12. Append-only decision log in the scope artifact
- Source: adityauttama/stella-protocol (`brain/vivre-cards.md`,
  append-only decision log).
- Mechanism: decisions made during scoping are logged
  append-only with timestamp and rationale, inside or alongside
  the scope artifact.
- Mapping: ASMP names "change control" as a Scope Map purpose;
  this gives it a concrete format.
- Fit note: small addition, real payoff for the "repairing
  drifted initiatives" use case.
- Deliberation 2026-10-06 (Madrid): fold as-is, or solve the same
  problem a different way? The problem is change control:
  preserving why decisions were made so drifted initiatives can be
  repaired and later readers understand the reasoning. Alternative:
  no new artifact — make decision records the close-out section of
  each checkpoint file ("decisions made in this span: what, why,
  what was rejected"), since checkpoints already exist to "preserve
  reasoning state." Skirs's read: the alternative is cleaner. It
  uses the existing checkpoint structure instead of adding a
  parallel log, and it keeps the artifact count flat. Counterpoint:
  checkpoints are working state; decisions that survive to synthesis
  still deserve one line each in IDEA-SCOPE.md itself. Awaiting
  Madrid's call.

## Structural (the steps approach — for the later discussion)

### C13. Router + step files + portable single-ingest
- Source: klmiing1229-a11y/scope (`SKILL.md` + `PORTABLE.md`);
  fastxyz/normalpowers (master prompt + skill files).
- Mechanism: thin router ingested first; step files loaded on
  demand; a condensed portable version for chat surfaces with no
  file access.
- Mapping: already Madrid's decided direction (2026-10-06). Listed
  here because it is the container the other candidates plug
  into — C6's per-step done-checks, for example, only make sense
  once steps are files.
- Status: DECIDED direction, implementation discussion deferred
  per Madrid.

---

## Not carried forward (assessed, rejected as candidates)

- BMAD's full lifecycle: phased and gated, but ends in code — wrong
  terminal state for a scope-only protocol.
- composable-business-os's catalog-selection mechanism:
  domain-specific and tool-based; the *diagnosis* is quotable, the
  mechanism doesn't transfer to a general protocol.
- normalpowers' metacognitive skill-check: general thinking
  hygiene, nothing scoping-specific to mine.
- waterfall-blueprint's IEEE document suite: the traceability idea
  transferred (C7); the document bureaucracy did not.
