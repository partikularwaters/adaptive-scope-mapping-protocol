# Changelog

All notable changes to this repository are documented here.

Compact and Comprehensive share one repository release version.

## [v0.2.0-draft] — 2026-09-05

Explicit Operating Surface fit, and a structurally reduced ASMP Compact.

### Added

- Operating Surface classification (Durable / Degraded-Artifact / Degraded-Packet), determined at intake in both protocols' Fit and Redirection Gates
- `Operating surface` field in Comprehensive's Document Control and output template
- Comprehensive checkpoint mechanics: default checkpoint location convention, structured `Next phase:` / `Blocking item:` entry-condition fields, a lightweight revision log, and namespacing for concurrent initiatives (Section 10)
- Compact: crisp numeric redirect-trigger rule, a required plain-language pre-approval summary before requesting sign-off, an expectation-setting line at first response, and interruption/resume guidance

### Changed

- ASMP Compact's fit ceiling (Section 2.1) narrowed to genuinely small work; work that no longer fits redirects to Comprehensive sooner
- ASMP Compact's working states renamed to plain language (Known / Assuming (untested) / Still need to check / Not doing yet / Not doing at all) — same five underlying distinctions, translated rather than reduced
- ASMP Compact's scoping flow reduced from seven steps (A–G) to four (Situation and Owner; Scope Boundary; Constraints and Definition of Done; Open Items and Handoff)
- ASMP Compact's Completion Check reduced from four checks to two (Evidence check; Coherence check)
- ASMP Compact's `IDEA-SCOPE.md` template reduced from nine sections to five; the Completion Check result now lives as one line in Document Control instead of its own section
- ASMP Compact's Document Control trimmed: `Scoping mechanism` and `Version or revision` no longer shown to the reader (redirection outcomes are still recorded under Handoff)
- Comprehensive's §10.4 persistence ladder reframed: Durable is the design target; Degraded-Artifact and Degraded-Packet are explicitly disclosed degradations, not equal alternatives
- `templates/compact-scope-template.md` and `templates/comprehensive-scope-template.md` resynced to the above
- `scripts/check-repo-integrity.sh`: version bumped; Compact structural marker updated from `## 8. Handoff` to `## 4. Open Items and Handoff`; added a check for the `Operating surface` field
- `examples/compact-software/IDEA-SCOPE.md` and `examples/non-software-project/IDEA-SCOPE.md` updated to the new Compact shape and labels
- `optional-adapters/banka-handoff.md` notes that a Comprehensive-origin handoff expects `Operating surface: Durable`

## [v0.1.0-draft] — 2026-08-17

Initial public-ready standalone repository structure.

### Added

- `protocols/ASMP-Compact.md` — standalone compact scoping protocol (v0.1.0-draft)
- `protocols/ASMP-Comprehensive.md` — standalone comprehensive scoping protocol (v0.1.0-draft)
- Output templates synchronized with protocol Section 7 (Compact) and Section 10.6 (Comprehensive)
- Examples: compact software widget, comprehensive public-health service, non-software community event, fit-gate redirection narratives
- `optional-adapters/banka-handoff.md` — explicit opt-in Banka compatibility pass (no embedded Banka rubric)
- `scripts/check-repo-integrity.sh` — deterministic repository checks

### Changed from source material

- Removed Banka filename-lineage note from Compact
- Removed embedded Banka adapter and copied five-question rubric from Comprehensive
- Replaced literal approved-scope immutability with provenance-preserving revision and supersession rules
- Made all three Comprehensive checkpoints durably persistent and retrievable with runtime-appropriate fallbacks
- Renumbered domain-specific handoff adapters in Comprehensive (research, design, operations, policy, creative, physical)

### PDF policy

PDFs are **not tracked** in this repository. Generate release attachments from Markdown when needed.

Reproducible render (requires [pandoc](https://pandoc.org/) and a PDF engine such as `pdflatex` or `weasyprint`):

```bash
pandoc protocols/ASMP-Comprehensive.md \
  -o ASMP-Comprehensive-v0.1.0-draft.pdf \
  --metadata title="Adaptive Scope Mapping Protocol — Comprehensive" \
  --metadata date="2026-08-17"
```

Verify the PDF title page version and date match `protocols/ASMP-Comprehensive.md` before attaching to a release.

[v0.2.0-draft]: https://github.com/example/adaptive-scope-mapping-protocol/releases/tag/v0.2.0-draft
[v0.1.0-draft]: https://github.com/example/adaptive-scope-mapping-protocol/releases/tag/v0.1.0-draft
