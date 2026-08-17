# Changelog

All notable changes to this repository are documented here.

Compact and Comprehensive share one repository release version.

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

[v0.1.0-draft]: https://github.com/example/adaptive-scope-mapping-protocol/releases/tag/v0.1.0-draft
