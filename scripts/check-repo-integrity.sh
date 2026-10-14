#!/usr/bin/env bash
# Deterministic repository integrity checks for ASMP.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

failures=0

fail() {
  echo "FAIL: $1" >&2
  failures=$((failures + 1))
}

pass() {
  echo "PASS: $1"
}

# --- Required files ---
required_files=(
  "README.md"
  "LICENSE"
  "CHANGELOG.md"
  "CONTRIBUTING.md"
  "protocols/ASMP-Compact.md"
  "protocols/ASMP-Comprehensive.md"
  "protocols/compact/ROUTER.md"
  "protocols/compact/PORTABLE.md"
  "protocols/comprehensive/ROUTER.md"
  "protocols/comprehensive/PORTABLE.md"
  "protocols/comprehensive/steps/00-intake-and-fit.md"
  "protocols/comprehensive/steps/01-foundation.md"
  "protocols/comprehensive/steps/02-boundary.md"
  "protocols/comprehensive/steps/03-readiness.md"
  "protocols/comprehensive/steps/04-synthesis.md"
  "templates/compact-scope-template.md"
  "templates/comprehensive-scope-template.md"
  "examples/comprehensive-service/01-foundation.md"
  "examples/comprehensive-service/02-boundary.md"
  "examples/comprehensive-service/03-readiness.md"
  "tests/fixtures/valid-comprehensive.md"
  "tests/fixtures/valid-compact.md"
  "tests/fixtures/failing-missing-invariants.md"
  "tests/fixtures/failing-unresolved-placeholders.md"
  "tests/fixtures/failing-tampered-hash.md"
  "scripts/verify-scope.sh"
  "scripts/verify_scope.py"
  "optional-adapters/banka-handoff.md"
  "scripts/check-repo-integrity.sh"
)

for f in "${required_files[@]}"; do
  if [[ -f "$f" ]]; then
    pass "required file exists: $f"
  else
    fail "missing required file: $f"
  fi
done

# --- Shared version consistency ---
expected_version="v0.2.0-draft"
compact_version=$(sed -n 's/^\*\*Protocol version:\*\* \([^ ]*\).*/\1/p' protocols/ASMP-Compact.md | head -n1)
comp_version=$(sed -n 's/^\*\*Protocol version:\*\* \([^ ]*\).*/\1/p' protocols/ASMP-Comprehensive.md | head -n1)
compact_router_version=$(sed -n 's/^\*\*Protocol version:\*\* \([^ ]*\).*/\1/p' protocols/compact/ROUTER.md | head -n1)
compact_portable_version=$(sed -n 's/^\*\*Protocol version:\*\* \([^ ]*\).*/\1/p' protocols/compact/PORTABLE.md | head -n1)
comp_router_version=$(sed -n 's/^\*\*Protocol version:\*\* \([^ ]*\).*/\1/p' protocols/comprehensive/ROUTER.md | head -n1)
comp_portable_version=$(sed -n 's/^\*\*Protocol version:\*\* \([^ ]*\).*/\1/p' protocols/comprehensive/PORTABLE.md | head -n1)
compact_template_version=$(sed -n 's/.*(protocol version \([^ ]*\) .*/\1/p' templates/compact-scope-template.md | head -n1)
comp_template_version=$(sed -n 's/.*(protocol version \([^ ]*\) .*/\1/p' templates/comprehensive-scope-template.md | head -n1)
readme_version=$(sed -n 's/^\*\*Current version:\*\* \([^ ]*\).*/\1/p' README.md | head -n1)
changelog_version=$(sed -n 's/^## \[\([^]]*\)\].*/\1/p' CHANGELOG.md | head -n1)

version_declarations=(
  "Compact redirect protocol:$compact_version"
  "Comprehensive redirect protocol:$comp_version"
  "Compact Router:$compact_router_version"
  "Compact Portable:$compact_portable_version"
  "Comprehensive Router:$comp_router_version"
  "Comprehensive Portable:$comp_portable_version"
  "Compact template:$compact_template_version"
  "Comprehensive template:$comp_template_version"
  "README:$readme_version"
  "CHANGELOG:$changelog_version"
)

for declaration in "${version_declarations[@]}"; do
  label="${declaration%%:*}"
  actual="${declaration#*:}"
  if [[ "$actual" == "$expected_version" ]]; then
    pass "shared version matches: $label ($actual)"
  elif [[ -z "$actual" ]]; then
    fail "shared version declaration missing: $label"
  else
    fail "shared version mismatch: $label declares $actual; expected $expected_version"
  fi
done

# --- No Banka in base protocols/templates ---
while IFS= read -r -d '' file; do
  if grep -qi 'banka' "$file"; then
    fail "unexpected Banka reference in base file: $file"
  else
    pass "no Banka reference: $file"
  fi
done < <(find protocols templates -type f -name '*.md' -print0)

# --- Banka confined to README optional section and adapter ---
readme_banka_count=$(grep -ci 'banka' README.md || true)
if [[ "$readme_banka_count" -gt 0 ]]; then
  pass "README mentions Banka ($readme_banka_count occurrences) — verify optional-workflow section only (manual review)"
else
  pass "README has no Banka mentions"
fi

adapter_banka_count=$(grep -ci 'banka' optional-adapters/banka-handoff.md || true)
if [[ "$adapter_banka_count" -gt 0 ]]; then
  pass "optional adapter references Banka ($adapter_banka_count occurrences)"
else
  fail "optional adapter should reference Banka for opt-in handoff"
fi

# --- Legacy Banka rubric regression detection (known distinctive markers) ---
legacy_banka_rubric_markers=(
  'Does the product require a defined, enforced visual design system'
  'multiple third-party libraries or APIs whose'
  'roughly 8 or more discrete'
  'multiple database tables, several auth flows'
  'running, dated log of decisions and progress'
)
for marker in "${legacy_banka_rubric_markers[@]}"; do
  if grep -Fqi "$marker" optional-adapters/banka-handoff.md; then
    fail "known legacy Banka rubric marker found in optional adapter: $marker"
  else
    pass "known legacy Banka rubric marker absent: $marker"
  fi
done

# --- Template structural marker spot-checks ---
compact_sections=(
  "## 0. Document Control"
  "## 4. Open Items and Handoff"
)
for s in "${compact_sections[@]}"; do
  if grep -qF "$s" templates/compact-scope-template.md; then
    pass "compact template contains: $s"
  else
    fail "compact template missing: $s"
  fi
done

comp_sections=(
  "## 0. Document Control"
  "## 18. Handoff"
  "## Appendix A — Evidence Register"
)
for s in "${comp_sections[@]}"; do
  if grep -qF "$s" templates/comprehensive-scope-template.md; then
    pass "comprehensive template contains: $s"
  else
    fail "comprehensive template missing: $s"
  fi
done

# --- Operating Surface field presence (Comprehensive only; Compact has no field to check) ---
if grep -qF "Operating surface:" templates/comprehensive-scope-template.md; then
  pass "comprehensive template declares Operating surface field"
else
  fail "comprehensive template missing Operating surface field"
fi

if grep -qF "Operating surface:" protocols/comprehensive/PORTABLE.md; then
  pass "Comprehensive PORTABLE declares Operating surface field"
else
  fail "Comprehensive PORTABLE missing Operating surface field"
fi

if grep -qF "Operating surface:" protocols/comprehensive/steps/04-synthesis.md; then
  pass "Step 04 synthesis declares Operating surface field"
else
  fail "Step 04 synthesis missing Operating surface field"
fi

# --- C10 Synthesis Invariants presence ---
c10_markers=(
  "Out of scope (Mandatory Invariant — C10)"
  "Assumptions (Mandatory Invariant — C10)"
  "Next responsible action (Mandatory Invariant — C10)"
)
for marker in "${c10_markers[@]}"; do
  if grep -qF "$marker" protocols/comprehensive/steps/04-synthesis.md; then
    pass "synthesis step enforces C10 marker: $marker"
  else
    fail "synthesis step missing C10 marker: $marker"
  fi
done

# --- Example placeholder hygiene ---
placeholder_pattern='\[(Initiative Name|TBD|TODO|FIXME|INSERT)\]'
while IFS= read -r -d '' file; do
  if grep -Eiq "$placeholder_pattern" "$file"; then
    fail "example contains a common unresolved placeholder: $file"
  else
    pass "example placeholder hygiene: $file"
  fi
done < <(find examples -type f -name 'IDEA-SCOPE.md' -print0)

# --- Internal markdown links in README (simple check) ---
while read -r link; do
  [[ "$link" =~ ^https?:// ]] && continue
  target="${link%%#*}"
  [[ -z "$target" ]] && continue
  if [[ -f "$target" || -d "$target" ]]; then
    pass "README link resolves: $target"
  else
    fail "README link missing target: $target"
  fi
done < <(grep -oE '\[[^]]+\]\(([^)]+)\)' README.md | sed -n 's/.*(\([^)]*\)).*/\1/p')

# --- PDF policy: no tracked PDF claiming different version ---
if [[ -f protocols/ASMP-Comprehensive.pdf ]]; then
  fail "tracked PDF found in protocols/ — prefer release attachments"
else
  pass "no tracked PDF in protocols/ (release-attachment policy)"
fi

# --- ASMP Scope Verifier (Python and POSIX fallback test runs) ---
while IFS= read -r -d '' file; do
  if ./scripts/verify-scope.sh "$file" >/dev/null 2>&1; then
    pass "scope verifier passed on example: $file"
  else
    fail "scope verifier failed on example: $file"
  fi
done < <(find examples -type f -name 'IDEA-SCOPE.md' -print0)

for fixture in tests/fixtures/valid-comprehensive.md tests/fixtures/valid-compact.md; do
  if ./scripts/verify-scope.sh --require-seal "$fixture" >/dev/null 2>&1; then
    pass "scope verifier passed with seal on fixture: $fixture"
  else
    fail "scope verifier failed on fixture: $fixture"
  fi
done

for neg in tests/fixtures/failing-*.md; do
  if ! ./scripts/verify-scope.sh "$neg" >/dev/null 2>&1; then
    pass "scope verifier correctly rejected invalid fixture: $neg"
  else
    fail "scope verifier erroneously passed invalid fixture: $neg"
  fi
done

if ASMP_FORCE_BASH=1 ./scripts/verify-scope.sh --require-seal tests/fixtures/valid-compact.md >/dev/null 2>&1; then
  pass "scope verifier POSIX bash fallback engine operational"
else
  fail "scope verifier POSIX bash fallback engine failed"
fi

echo
if [[ "$failures" -gt 0 ]]; then
  echo "$failures check(s) failed." >&2
  exit 1
fi

echo "All integrity checks passed."
exit 0
