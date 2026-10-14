ASMP DRY-RUN [User](#user) [Builder](#builder) [Risk Owner](#risk) [Consolidation](#consolidation) [Verdict](#verdict)

Protocol dry-run — three-agent audit

# Does the Adaptive Scope Mapping Protocol hold up in the room?

Three independent reviewers each ran ASMP against a different real project, from a different accountability lens — usability, architecture, and risk — then compared notes without softening disagreement.

**Subject** — protocols/ASMP-Compact.md & ASMP-Comprehensive.md, v0.1.0-draft **Method** — 3 agents · 3 perspectives · 3 unrelated projects **Date** — 2026-09-05

## The three dry-runs

User — Real-World Usability

### Dental clinic booking

A non-technical two-dentist clinic owner asks an AI to scope "add online appointment booking."

Ran under ASMP Compact

Builder — Architecture & Correctness

### Monolith → microservices

A 6-person team scopes decomposing a legacy invoicing monolith, across multiple sessions and agents.

Ran under ASMP Comprehensive

Risk Owner — Security, Failure & Recovery

### Benefits eligibility screener

A city government scopes an AI-assisted pre-screener for public benefits, tested adversarially.

Ran under ASMP Comprehensive

User

## Real-World Usability

Project: online booking for a 2-dentist clinic · ASMP Compact, Steps A–G

Verdict

Yes, but with real friction. A non-technical owner can walk out with a usable one-page brief — the flow maps naturally onto how a busy owner already thinks. But the protocol leaks its own process vocabulary into the conversation and the final document with no instruction to translate it, and it hands the one genuinely hard question here — patient-data privacy — to a "verify or leave Open" mechanism that never actually resolves it for the owner.

Simulated trace

**AI:** "Anything already in place I should look at?" **Owner:** "Website's just something my nephew built years ago… I saw Zocdoc has booking, want something like that. Budget — whatever's reasonable."

The Fit Gate correctly surfaces one real signal — booking collects patient name, phone, and visit reason, which is privacy/HIPAA-adjacent for a dental practice — but saying so out loud ("I want to flag it, not escalate this") reads to the owner as the session suddenly getting complicated for no reason she asked for.

Partial `IDEA-SCOPE.md` produced from the run:

## 4. Constraints and Assumptions - Open — Vendor must be HIPAA-compliant / offer a BAA — owner to verify during vendor selection — blocks vendor choice - Assumption — Budget is "reasonable," no fixed ceiling ## 6. Open and Deferred Items - Open — HIPAA/BAA verification — Owner — before vendor selected — blocks Step 3 (adoption) - Open — Whether second dentist has veto on vendor choice — Owner — before approval — blocks sign-off

The owner leaves the session having done real, honest work on scope — but the one question she actually needed answered (which vendor is safe to use) is exactly where the document stops.

Findings

1

ASMP-Compact.md — First Response, §0 template

Process vocabulary ("Fit and Redirection Gate," "Scoping mechanism: ASMP Compact") is spoken aloud and permanently saved into the owner's reference document, with no instruction anywhere to translate it into plain language.

Friction

2

ASMP-Compact.md §3 — Working States

The Confirmed / Assumption / Open / Deferred / Excluded taxonomy is used on the person with no scripted plain-language explanation. Quality depends entirely on ad hoc AI judgment in the moment, not on the protocol text.

Friction

3

ASMP-Compact.md §5 — Verification Guardrail vs. §2.2

The one question with real stakes (is the vendor safe with patient data) correctly cannot be closed inside the chat — but the owner spent the session on scope ceremony around the easy 90% and leaves exactly where she started on the hard 10%.

Friction

4

ASMP-Compact.md §2.2

"Several smaller signals may also justify redirection" has no worked threshold. An identical clinic project could plausibly over-trigger into Comprehensive or under-trigger and skip the privacy signal entirely, depending on which session runs it.

Friction

5

ASMP-Compact.md §8, Step 5

Nothing instructs the AI to surface the handful of decisions that actually need the owner's eyes before requesting sign-off — a rushed skim can approve a document with load-bearing Open items still unresolved.

Friction

6

ASMP-Compact.md §4, §8

No guidance anywhere for resuming after the owner closes the chat mid-session and returns a week later — the protocol assumes one continuous, attentive sitting.

Cosmetic

7

README.md — "How to run a protocol"

Nothing sets the expectation that ASMP produces a scoping document, not vendor research — an owner who wanted booking-tool help is handed a document whose next action is still "go pick a vendor."

Cosmetic

Builder

## Architecture & Project-Specific Correctness

Project: legacy invoicing monolith → microservices · ASMP Comprehensive, Phases A–L + checkpoints

Verdict

ASMP Comprehensive can be started and narrated correctly by any AI agent — the phase sequence, gate logic, and final-synthesis contract are unambiguous, and the template mirrors §10.6 with zero drift. But the protocol's headline claim — that checkpoints make work "recoverable across sessions and agents" — is not actually buildable as specified: §10 says what a checkpoint must contain, never where it lives, in what parseable shape its "entry condition" is expressed, or how a second agent verifies persistence rather than trusting the first agent's say-so.

Simulated trace

The Fit Gate routes the migration to Comprehensive unambiguously — finance exposure, tight system coupling, and migration risk are all named triggers in §4. Phases A–D were carried into a real `01-foundation.md`:

## Domain vocabulary (partial) | Term | Meaning | State | | "Reconciled" | paid amount == invoiced amount in ledger, verified by nightly batch | Confirmed — Verified Fact (checked against billing-core/docs/glossary.md, 2026-09-02) | | "Invoice service" | mechanism-shaped — boundary undefined | Open — Decision, owner: backend lead, before Phase E | ## Active assumptions - Working Assumption: Postgres logical replication sufficient for cutover (confidence: Medium, untested at current volume) - Open — Decision: who owns "accountable sponsor" — named informally in kickoff, never confirmed in writing

A **fresh agent**, given only the protocol text and this checkpoint, was told to resume. It had to invent, unprompted: where `02-boundary.md` should live relative to the first file (no directory convention exists); how to parse "resume at Phase E once the boundary decision is settled" into an actual next action (no structured entry-condition field exists); and how to confirm the checkpoint is actually durably saved rather than pasted text that will vanish again (§10.5's "verify it exists" has no method attached, and the fresh agent may not share the first agent's filesystem access at all).

`scripts/check-repo-integrity.sh` was run directly: it passes cleanly, and the checks it does make (version consistency, template markers, placeholder hygiene, link resolution) are real and accurate — narrower than the README's summary sentence implies, but not misleading.

Findings

1

ASMP-Comprehensive.md §10.4–10.5

No mandated checkpoint directory or manifest. Two agents on the same effort can each satisfy the letter of the protocol while writing to different paths, silently breaking the one property §10 exists to guarantee.

Blocking

3

ASMP-Comprehensive.md §10.4–10.5

"Verify that each checkpoint exists in the intended durable location" is unimplementable as written — no method is given for a resuming agent that may lack the writing agent's filesystem or tool access.

Blocking

4

ASMP-Comprehensive.md §10.1–10.3

No required machine-parseable "entry condition" schema — resumption fidelity depends entirely on how disciplined the prior agent's free prose happened to be.

Blocking

2

ASMP-Comprehensive.md §10.4

Checkpoints are "amendable" with no append-log or revision marker — after several team disputes and edits, a fresh agent sees only the final overwritten prose, contradicting the protocol's own traceability principle (§2.9).

Drift risk

6

ASMP-Comprehensive.md §4.2, ASMP-Compact.md §2.4

A "model-selected redirection" isn't required to emit the standard section set — two agents redirecting the same project can produce structurally incomparable documents both labeled `IDEA-SCOPE.md`.

Drift risk

7

ASMP-Comprehensive.md §10

No collision or namespacing guidance for concurrent initiatives in the same workspace — two unrelated efforts would produce identically named checkpoint files with no required disambiguation.

Drift risk

5

examples/, CONTRIBUTING.md

Zero worked examples of the three checkpoint files exist anywhere in the repo — the only mechanism unique to Comprehensive, and the project's own 9-scenario test table never tests checkpoint persistence or fresh-agent resumption.

Minor

8

scripts/check-repo-integrity.sh; README.md line 97

The README's "absence of downstream-framework coupling" check only greps `protocols/` and `templates/` for the string "banka" — narrower coverage than the summary sentence implies, though not inaccurate about what it checks.

Minor

9

templates/comprehensive-scope-template.md vs. §10.6

Verified structurally identical today, headings and columns match exactly — the one seam that is fully sound, though only weakly enforced going forward by a shallow two-heading spot-check.

Minor

Risk Owner

## Security, Failure & Recovery

Project: public benefits eligibility pre-screener · ASMP Comprehensive, adversarial run of Gates G/J

Verdict

As written, ASMP Comprehensive is not safe to rely on unattended or lightly supervised for consequential public-impact work. Every control — the Fit Gate, the verification regime, Gate G, Gate J, "do not call it final" — is a textual instruction to the same AI agent that is simultaneously conducting the interview, grading its own evidence, and writing its own gate log. There is no external actor, no independent check, and no tamper-evidence anywhere from intake to "Approved."

Adversarial trace

Framed the project to minimize it: *"a checklist tool that flags applications — caseworkers make every final decision, it's really just a faster spreadsheet."* §4's "public impact or vulnerable populations" trigger does correctly catch this on a careful reading, but nothing forces the AI to apply it against a sponsor's own minimizing language — it is a judgment call made from inside the same conversation the sponsor is steering.

A plausible domain-model row a real session could produce, satisfying §8's letter while failing its spirit:

| Eligibility pre-screen score | Model output classifying applicant as Likely Eligible / Needs Review / Likely Ineligible | Confirmed — Verified Fact (Vendor validation report: "94% concordance with caseworker determinations on 2,400 historical cases," checked 2026-09-01) |

Named source, dated, tagged correctly — and yet the source is the vendor grading its own product, and "concordance with past caseworker determinations" silently launders any existing bias in human decisions into a "Verified Fact" about the new system. §8 requires the source be named and current; it does not require independence or scrutiny of what the claim actually measures.

Gate G was closed by recording "possible disparate impact on non-English speakers" as an *accepted risk* with an owner — technically satisfying the gate with no severity threshold. Gate J was closed with "Reviewer: County Counsel (pending)" logged as an ordinary open item rather than a hard block on approval.

Findings — failure scenario, and whether a control exists

1

ASMP-Comprehensive.md §4

Fit Gate is gameable by sponsor framing; the trigger phrase exists in the text but nothing forces it to override minimizing language. No recovery if missed.

No control

9

Document Control field, §13, optional-adapters/banka-handoff.md

"Status: Approved" is an unenforced text field — no signature, hash, or gate-log validation separates it from Draft, and the Banka adapter treats it as authoritative without re-validating gate resolution. The largest single gap for irreversible downstream action.

No control

4

ASMP-Comprehensive.md §9, Gate J

An unrun mandated independent review can be logged as an ordinary Open item rather than a hard block — §13's blocking conditions don't explicitly name "unrun Gate J."

No control

3

ASMP-Comprehensive.md §9, Gate G

Gate G only requires a foreseeable harm be recorded, not resolved or thresholded — an accepted risk to a vulnerable population can pass the gate on the say-so of the same sponsor who wants to avoid scrutiny.

No control

5

ASMP-Comprehensive.md §10

No concurrency control — two sessions editing the same checkpoint file concurrently silently clobber each other, and the risk isn't even named (unlike checkpoint-loss, which is).

No control

2

ASMP-Comprehensive.md §8

Verification checks form (named source, date) not substance (independence, what the claim actually measures) — a vendor's self-graded accuracy report can clear the bar unchanged.

Advisory only

6

ASMP-Comprehensive.md §10.4

Persistence is self-certified from inside a runtime that may itself be ephemeral — the failure mode is named, but no independent check (e.g. reopening in a fresh session) is required before proceeding.

Partial control

7

ASMP-Comprehensive.md §10.4

The bottom of the persistence fallback ladder is trust-only — if even a copyable packet is lost after the person says "saved," there is no checksum or resumption test, and the residual risk is undisclosed.

No control

8

ASMP-Comprehensive.md §9, Gate D

Gate D checks that Deferred items have a trigger at closing time, but nothing re-scans an Approved document later for triggers that have since expired — stale risk assumptions can persist indefinitely as if current.

No control

10

Cross-cutting

The recurring pattern: every safeguard is phrased as self-instruction to the acting AI, with no external verifier anywhere able to catch a careless, rushed, or motivated-reasoning violation of its own rules.

No control

## Consolidation

Three sessions, three unrelated projects, three different jobs to protect — read together, the disagreements are as informative as the agreement.

Where they agree

#### A. Every guardrail is self-applied by the same agent it's meant to constrain

The Fit Gate, the verification regime, Gate G/J, and "do not call it final" are all instructions to the AI conducting the session — none has an external check. User found this as an un-scripted judgment call on the clinic's privacy signal; Builder found it in the unenforced "model-selected redirection" and self-certified persistence test; Risk Owner named it directly as the report's central pattern.

User · #4Builder · #6, #3Risk · #1, #10

#### B. Continuity across time is asserted, not engineered

Mid-session interruption (User), cross-session/cross-agent checkpoint recovery (Builder), and checkpoint persistence under concurrent edits (Risk Owner) are the same underlying gap surfacing at three different scales — from "the owner closes the laptop" to "a fresh agent can't find the file" to "two sessions clobber each other."

User · #6Builder · #1, #3, #4Risk · #5, #6, #7

#### C. The Fit Gate's materiality threshold isn't repeatable

User found no worked criterion behind "several smaller signals may justify redirection," making outcomes session-dependent even for a harmless project. Risk Owner then successfully game-tested the same softness with minimizing sponsor language on a harmful one.

User · #4Risk · #1

Where they disagree

#### D. Overall severity tracks the project's stakes, not the protocol's quality

User (Compact, reversible, low-stakes) found no blocking issues. Builder (Comprehensive, technical, multi-session) found the checkpoint mechanism structurally blocking. Risk Owner (Comprehensive, public-impact) called the whole thing unacceptable as-is. Read one way, this vindicates ASMP's own proportional-rigor thesis — low-stakes work survives its gaps fine. Read the other way, it means the extra Comprehensive-only machinery — the exact layer meant to carry the highest-consequence work — is precisely the layer all three found unenforced.

#### E. The tag taxonomy is either fine or alienating, depending who's asked

Builder verified the Confirmed / Assumption / Open register works cleanly in a technical context — protocol and template stay in exact sync, zero drift. User found the identical taxonomy unexplained and confusing for a lay clinic owner. ASMP-Comprehensive.md's own preamble claims the specialist should "adapt the depth and language of the process to the work" — nothing in the text actually adapts register complexity to audience sophistication, so this tension sits genuinely unresolved rather than reconciled.

#### F. Builder is the one report with a clean positive finding

Template/protocol synchronization and the integrity script's actual (if narrower-than-advertised) checks both hold up under direct verification — worth stating plainly so the audit doesn't read as uniformly negative. Part of the system is demonstrably sound today.

Dry-run status: **Complete** Scoping mechanism: **ASMP Compact + Comprehensive** Reviewed by: **3 independent agents**

## Verdict

ASMP is internally coherent and does what it says at the stakes level it names for itself — it is a well-designed cognitive discipline for a competent, honest facilitator and a competent, honest sponsor. The dry-run's real finding is that every one of its guardrails is self-applied by the same process it's supposed to constrain, and that gap is invisible at Compact scale, structurally blocking at Comprehensive's cross-session promise, and an active safety concern once the subject is public-impact and irreversible.

Pass

#### Compact, reversible work

Produces a genuinely usable scope brief. Remaining issues are UX/language polish, not correctness.

Conditional

#### Comprehensive, multi-session technical work

Needs a checkpoint storage location convention, a structured entry-condition schema, and an independent persistence check before its cross-agent recovery claim can be trusted.

Not safe as-is

#### High-consequence, public-impact work

Requires an external layer ASMP doesn't provide: hard-triggered fit rules, real independent sign-off on Gates G/J, and a non-self-authored approval record before "Approved" licenses anything.

Net reading: the dry-run confirms ASMP's own stated thesis — proportional rigor, scaled to consequence — while showing that the enforcement layer needed to make "Comprehensive" trustworthy at the top of its own declared range doesn't yet exist in the protocol text. That is a specific, addressable gap, not a scattered one: all three reviewers, working independently on unrelated projects, converged on the same root cause.

ASMP dry-run · User, Builder, and Risk Owner perspectives run independently, consolidated without reconciling disagreement