# Adaptive Scope Mapping Protocol (ASMP)

A proportionate, evidence-aware protocol for turning intentions into decision-ready scope.

ASMP helps you scope new, evolving, replacing, investigative, recovering, or retiring initiatives — in software, services, operations, policy, creative work, physical projects, and mixed domains. Its normal output is an independent **`IDEA-SCOPE.md`** scope artifact you can hand to any suitable implementation, research, design, operations, or project-management workflow.

ASMP is **standalone**. It does not require any downstream framework to produce a complete, decision-ready scope artifact.

**Current version:** v0.2.0-draft (2026-09-05)

---

## What ASMP is

ASMP is a pair of Markdown protocols — **Compact** and **Comprehensive** — that guide a structured scoping conversation. A Scope Mapping Specialist (human or AI assistant) clarifies purpose, boundaries, constraints, evidence, uncertainty, and handoff until the work is decision-ready.

The result is not a build plan or a pitch deck. It is a durable scope artifact honest about what is confirmed, assumed, open, and excluded.

## Who it is for

- Individuals or teams starting something new and needing shared scope before committing
- People repairing drifted, stalled, or unclear initiatives
- Facilitators preparing handoff to design, engineering, research, operations, procurement, or governance
- AI-assisted workflows that need guardrails against over-scoping, fake certainty, or silent scope creep

## How to choose Compact, Comprehensive, or no formal scoping

| Situation | Recommended approach |
| --- | --- |
| One deliverable, one owner who is also the decision-maker, a delivery path of hours to a few days, at most one dependency, trivially reversible | **ASMP Compact** |
| Material consequence, uncertainty, interdependence, stakeholder diversity, lifecycle burden, or evidence burden — or reversible work too large for Compact's narrower ceiling | **ASMP Comprehensive** |
| Already explicit, immediately reversible, no coordination, no decision value from a formal document | **Lighter action** — skip formal scoping; do the work or track a simple task |

Both protocols include a **Fit and Redirection Gate**. If the chosen protocol is mismatched, the specialist explains why and asks approval before redirecting. Compact does not silently become Comprehensive, and Comprehensive does not impose heavy process on contained work.

This table addresses the work's own complexity. A second, independent factor is where the session is actually running: **ASMP Compact assumes a plain conversational surface with no persistent files** — it is deliberately sized and structured for that context. **ASMP Comprehensive assumes an agentic runtime that can durably read and write files across sessions** — a coding agent or an equivalent automation environment — because its checkpoint system depends on that capability. Running Comprehensive without durable file access degrades its cross-session recoverability guarantee; the portable edition (`protocols/comprehensive/PORTABLE.md`) discloses that fallback explicitly.

## How to run a protocol

1. **For file-capable agent runtimes / IDEs:** Supply **`protocols/comprehensive/ROUTER.md`** or **`protocols/compact/ROUTER.md`** to your assistant (the router adopts the Specialist role and reads step files progressively as milestones complete).
2. **For plain chat surfaces without file tools:** Copy and paste the single-ingest portable edition — **`protocols/comprehensive/PORTABLE.md`** or **`protocols/compact/PORTABLE.md`**.
3. Provide existing material — notes, drafts, data, policies, screenshots, prior attempts.
4. Answer focused questions one at a time. Challenge vague language; verify consequential external claims or label them Open/Assumption.
5. Approve any redirection before switching rigor level.
6. Review the resulting **`IDEA-SCOPE.md`**. Approve it or request corrections.
7. Hand off to the receiving discipline or workflow named in the document.

Templates in [`templates/`](templates/) mirror the protocol output contracts and introduce no extra requirements.

## What `IDEA-SCOPE.md` contains

**Compact** produces a **Scope Brief** with purpose, primary person and owner, boundary, constraints, definition of done, open items, completion check, and handoff.

**Comprehensive** produces a **Scope Map** with executive frame, stakeholders, outcomes, vocabulary, staged sequence, constraints, assumptions, dependencies, risks, governance, registers, gate log, evidence appendix, and handoff.

In both cases the artifact must stand alone: a reader who missed the conversation can understand the work, its rationale, its boundaries, its uncertainty, and its next step.

## Repository layout

```text
protocols/           Canonical ASMP routers, step files, and portable single-ingest editions
  compact/           Compact router and portable single-ingest
  comprehensive/     Comprehensive router, progressive step files, and portable single-ingest
templates/           Output templates synchronized with the protocols
examples/            Sanitized, non-authoritative completed scopes
optional-adapters/   Explicit opt-in compatibility passes (not part of normal ASMP)
scripts/             Integrity checks
```

See [`examples/`](examples/) for software, service, non-software, and fit-gate redirection illustrations.

## Receiving workflows and optional integrations

After **`IDEA-SCOPE.md`** is complete, hand it to the discipline or workflow responsible for the next stage. Depending on the scope, that may be research or validation, design, technical architecture or engineering, project or program planning, procurement or vendor selection, operations or service management, governance or specialist review, implementation, launch, migration, or retirement.

ASMP does not prescribe a specific downstream framework or tool. The receiving workflow may be an organization's existing process, a specialist methodology, a project-management system, another AI-assisted protocol, or a purpose-built framework.

### Optional Banka integration

For software projects that use [**Banka**](https://github.com/partikularwaters/Banka) as the receiving development framework, ASMP can provide the completed decision-ready scope artifact as origin input.

For an existing software codebase that will enter Banka, the **Banka Docking Protocol** may be used to prepare the project before Banka adoption.

If you explicitly want a Banka-ready compatibility pass after ASMP is complete, see [`optional-adapters/banka-handoff.md`](optional-adapters/banka-handoff.md). The adapter is opt-in, requires the current external Banka protocol, and does not modify the canonical scope.

These integrations are optional. **ASMP is complete without Banka or any other downstream framework.**

## Versioning, contribution, and license

- **Versioning:** Compact and Comprehensive share this repository's release version (`v0.1.0-draft` initially). See [`CHANGELOG.md`](CHANGELOG.md).
- **Canonical authority:** Markdown files in `protocols/` override templates, examples, optional adapters, and any PDF release attachment.
- **PDF policy:** PDFs are release attachments only, generated from Markdown — not independently edited authorities. Render command documented in [`CHANGELOG.md`](CHANGELOG.md).
- **Contributing:** See [`CONTRIBUTING.md`](CONTRIBUTING.md).
- **License:** [MIT](LICENSE)

## Scope verification tool

Validate any completed `IDEA-SCOPE.md` artifact against ASMP contracts, mandatory C10 invariants, gate resolution, placeholder hygiene, and tamper-evident SHA-256 seals:

```bash
# Validate a scope artifact
bash scripts/verify-scope.sh path/to/IDEA-SCOPE.md

# Compute and output canonical SHA-256 seal line for Document Control
bash scripts/verify-scope.sh --seal path/to/IDEA-SCOPE.md

# Apply seal directly into Document Control
python3 scripts/verify_scope.py --apply-seal path/to/IDEA-SCOPE.md

# Machine-readable JSON output for automated CI pipelines
bash scripts/verify-scope.sh --json path/to/IDEA-SCOPE.md
```

The verifier runs via Python 3 standard library by default, automatically falling back to a self-contained POSIX Bash engine when Python is unavailable.

## Integrity checks

```bash
bash scripts/check-repo-integrity.sh
```

Run before releases. The script verifies required files, shared version consistency, template structural markers, absence of downstream-framework coupling in base artifacts, example placeholder hygiene, known legacy Banka rubric regression markers in the optional adapter, link resolution, and runs the scope verifier across all repository examples and test fixtures. Semantic protocol/template coherence and example quality remain manual review responsibilities.
