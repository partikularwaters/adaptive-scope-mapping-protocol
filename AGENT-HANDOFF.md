# Agent handoff — ASMP development

Date: 2026-10-11. Written by Skirs (Madrid's agent) so an outside
coding agent can continue ASMP development from Madrid's actual
decisions instead of inventing them. Working document: delete or
archive once the work lands.

## What ASMP is

Adaptive Scope Mapping Protocol. Directs a runtime agent to act as a
Scope Mapping Specialist: takes an initiative from intake and evidence
through a fit gate and a core mapping cycle (Phases A–L), producing
checkpoint files (`01-foundation.md`, `02-boundary.md`,
`03-readiness.md`) and a final `IDEA-SCOPE.md` synthesis. Current canon
is v0.2.0-draft under `protocols/`. Scope-only: it maps, it never
builds.

## Madrid's decisions (do not re-litigate; do not invent alternatives)

1. The single-file canon is retired. Neither Compact nor Comprehensive
   stays one big file: large files drift as token count grows and the
   agent loses the thread.
2. New shape: stepped ingestion for file-capable agents (thin router +
   phase/gate step files, progressive disclosure) PLUS a portable
   single-ingest version for plain chat surfaces with no file access.
   Model: klmiing1229-a11y/scope's `SKILL.md` + `PORTABLE.md` split.
3. C10 ADOPTED: non-negotiables baked into every synthesis
   (out-of-scope section present, assumptions labeled as assumptions,
   one named next action, change trigger stated). Governing principle
   (merged from C11): the synthesis passes only if an agent that never
   saw the conversation could execute the handoff from the document
   alone.
4. Research goal is improvement-mining from similar-method repos, never
   positioning. Do not add "how ASMP differs" framing to the README
   or docs.

## Open questions (ask Madrid; do not invent answers)

- Exact file breakdown per protocol: which steps, what each contains.
- Whether the router keeps the "acknowledge + begin intake, don't
  recite the protocol" first-response rule.
- C12: decision log. Fold as-is, or make decision records the close-out
  section of each checkpoint file ("decisions made in this span:
  what, why, what was rejected")? Skirs recommends the latter: no
  new artifact, uses the existing checkpoint structure. Awaiting
  Madrid's call.
- What gets mined first from the repo-shape findings.

## Candidate state

Full detail: `improvement-candidates-2026-10-06.md` (repo root).

- C1–C3: worked delivery patterns folded in (anti-sycophancy posture
  for intake, one-question-at-a-time questioning, Demand Reality
  evidence probe).
- C4, C6, C7: practical sketches folded in (scored fit-gate rubric,
  checkable phase-completion criteria, evidence traceability tags).
- C5, C8, C9, C13: still candidates, awaiting Madrid's decision.
- Four approaches assessed and rejected with reasons (in the file).
  Do not revive them without Madrid's explicit word.

## Working rules

- Madrid diffs and merges himself in VS Code. Draft only: never stage,
  never force-push, never rewrite history.
- Verify byte counts after file writes where it matters.
- Drafts go back to Skirs for verification against this brief before
  Madrid reviews. In your summary, flag every place where you made a
  judgment call this brief didn't cover.
