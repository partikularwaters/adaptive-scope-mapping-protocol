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
  "templates/compact-scope-template.md"
  "templates/comprehensive-scope-template.md"
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
expected_version="v0.1.0-draft"
compact_version=$(sed -n 's/^\*\*Protocol version:\*\* \([^ ]*\).*/\1/p' protocols/ASMP-Compact.md | head -n1)
comp_version=$(sed -n 's/^\*\*Protocol version:\*\* \([^ ]*\).*/\1/p' protocols/ASMP-Comprehensive.md | head -n1)
compact_template_version=$(sed -n 's/.*(protocol version \([^ ]*\) .*/\1/p' templates/compact-scope-template.md | head -n1)
comp_template_version=$(sed -n 's/.*(protocol version \([^ ]*\) .*/\1/p' templates/comprehensive-scope-template.md | head -n1)
readme_version=$(sed -n 's/^\*\*Current version:\*\* \([^ ]*\).*/\1/p' README.md | head -n1)
changelog_version=$(sed -n 's/^## \[\([^]]*\)\].*/\1/p' CHANGELOG.md | head -n1)

version_declarations=(
  "Compact protocol:$compact_version"
  "Comprehensive protocol:$comp_version"
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
  "## 8. Handoff"
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

echo
if [[ "$failures" -gt 0 ]]; then
  echo "$failures check(s) failed." >&2
  exit 1
fi

echo "All integrity checks passed."
exit 0
