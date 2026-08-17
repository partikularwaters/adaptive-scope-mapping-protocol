# Contributing to ASMP

Thank you for helping improve the Adaptive Scope Mapping Protocol.

## Canonical authority

**Markdown files in `protocols/` are canonical.** Templates, examples, optional adapters, tools, and PDF release attachments must defer to them.

When changing behavior:

1. Update the relevant protocol first.
2. Sync templates if output headings or contracts changed.
3. Update or add examples that demonstrate the new behavior.
4. Run `bash scripts/check-repo-integrity.sh`.

Do not duplicate rules across templates and adapters when the protocol already states them. Templates extract; they do not invent requirements.

## Proposing protocol changes

1. Open an issue describing the problem, evidence, and proposed change.
2. Submit a pull request with protocol edits and rationale.
3. Include example or scenario updates when behavior changes.
4. Note whether the change affects Compact, Comprehensive, or both.

Prefer changes that preserve proportional rigor, evidence honesty, and standalone neutrality.

## What not to do

- Do not embed Banka (or other downstream framework) rules, rubrics, tiers, templates, or skills into base protocols or templates.
- Do not add Banka references to normal ASMP flow outside the README optional-workflow section and `optional-adapters/`.
- Do not edit PDFs independently of Markdown.
- Do not expand Compact into Comprehensive silently or impose Comprehensive ceremony on contained work.

## Optional adapters

Adapters in `optional-adapters/` are explicit opt-in compatibility passes. They must:

- Start from a completed independent `IDEA-SCOPE.md`
- Require externally supplied receiver protocols
- Keep receiver-specific material out of the canonical scope

Do not copy external rubrics into this repository.

## AI assistance attribution

If AI materially shaped a commit, note it in the commit body:

```text
Assisted-by: Cursor (Composer)
```

Use the actual provider and model when known. Do not invent co-author identities or add AI names to copyright lines.

## Behavioral test scenarios

Run these manually (or automate later) when validating protocol or example changes:

| # | Scenario | Expected behavior |
| --- | --- | --- |
| 1 | Small reversible task | Remains Compact |
| 2 | Trivial one-line change | Redirected to lighter action-oriented approach |
| 3 | Consequential multi-party service | Redirected to Comprehensive |
| 4 | Neighborhood event (non-software) | Scoped without software-product assumptions |
| 5 | Unsupported consequential claim | Stays Open or Assumption; not Confirmed |
| 6 | Missing stakeholder approval | Not invented; recorded as Open |
| 7 | Scope completion | Distinguished from outcome success |
| 8 | Completed scope | Can hand off to non-Banka workflow without modification |
| 9 | Banka-ready request | Banka-specific output only after explicit opt-in via optional adapter |

See [`examples/redirected-scope/README.md`](examples/redirected-scope/README.md) for fit-gate illustrations.

## Releases

- Use semantic versioning once the public contract stabilizes; `v0.1.0-draft` marks active structural revision.
- Tag releases; attach generated PDFs only after render verification against Markdown version/date.
- Update `CHANGELOG.md` for every release.

## Questions

Open an issue for questions about scope, neutrality, or adapter boundaries before large refactors.
