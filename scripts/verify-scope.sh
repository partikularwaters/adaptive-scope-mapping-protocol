#!/usr/bin/env bash
# ASMP Scope Verifier (Dual Runtime: Python 3 by default, falling back to POSIX Bash)
# Validates IDEA-SCOPE.md files against ASMP contracts, C10 invariants, gate resolution,
# placeholder hygiene, and canonical SHA-256 tamper-evident hash seals.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Dual Runtime: If python3 is available (and ASMP_FORCE_BASH is not set), delegate to Python AST/regex implementation
if [[ "${ASMP_FORCE_BASH:-0}" != "1" ]] && command -v python3 >/dev/null 2>&1; then
  exec python3 "$SCRIPT_DIR/verify_scope.py" "$@"
fi

# ==============================================================================
# POSIX Bash Fallback Implementation (Zero dependencies)
# ==============================================================================

compute_hash() {
  local target="$1"
  # Strip scope hash line, strip trailing whitespace, normalize
  if command -v shasum >/dev/null 2>&1; then
    grep -iv '^[[:space:]]*[-*]\?[[:space:]]*scope hash[[:space:]]*:' "$target" | sed -e 's/[[:space:]]*$//' | shasum -a 256 | awk '{print $1}'
  elif command -v sha256sum >/dev/null 2>&1; then
    grep -iv '^[[:space:]]*[-*]\?[[:space:]]*scope hash[[:space:]]*:' "$target" | sed -e 's/[[:space:]]*$//' | sha256sum | awk '{print $1}'
  else
    echo "NO_SHA256_TOOL"
  fi
}

seal_mode=0
json_mode=0
require_seal=0
target_file=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --seal)
      seal_mode=1
      shift
      ;;
    --json)
      json_mode=1
      shift
      ;;
    --require-seal)
      require_seal=1
      shift
      ;;
    -*)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
    *)
      target_file="$1"
      shift
      ;;
  esac
done

if [[ -z "$target_file" ]]; then
  echo "Usage: $0 [--seal] [--json] [--require-seal] <path/to/IDEA-SCOPE.md>" >&2
  exit 1
fi

if [[ ! -f "$target_file" ]]; then
  echo "Error: File not found: $target_file" >&2
  exit 1
fi

computed_hash=$(compute_hash "$target_file")

if [[ $seal_mode -eq 1 ]]; then
  echo "- Scope hash: sha256:$computed_hash"
  exit 0
fi

# Detect mechanism
mechanism="comprehensive"
if grep -qF "## 4. Open Items and Handoff" "$target_file" || grep -qi "ASMP Compact" "$target_file"; then
  mechanism="compact"
fi

status=$(sed -E -n 's/^[[:space:]]*[-*]?[[:space:]]*Status:[[:space:]]*//p' "$target_file" | head -n1 | tr -d '\r')
[[ -z "$status" ]] && status="Draft"

errors=()
warnings=()

add_error() {
  errors+=("$1")
}

add_warning() {
  warnings+=("$1")
}

# 1. Mandatory sections check
if [[ "$mechanism" == "comprehensive" ]]; then
  comp_sections=(
    "## 0. Document Control"
    "## 1. Executive Frame"
    "## 2. Current Reality and Intent"
    "## 3. People, Roles, and Impact"
    "## 4. Outcomes and Guardrails"
    "## 5. Domain Model and Vocabulary"
    "## 6. Scope and Boundaries"
    "## 7. Sequence"
    "## 8. Constraints and Operating Context"
    "## 9. Assumptions"
    "## 10. Dependencies"
    "## 11. Risks and Responses"
    "## 12. Approach Boundaries"
    "## 13. Definition of Done and Acceptance"
    "## 14. Governance and Change"
    "## 15. Decision Register"
    "## 16. Open and Deferred Items"
    "## 17. Gate Log"
    "## 18. Handoff"
  )
  for sec in "${comp_sections[@]}"; do
    if ! grep -qF "$sec" "$target_file"; then
      add_error "Missing mandatory section: $sec"
    fi
  done
  if ! grep -qE '^## Appendix A' "$target_file"; then
    add_error "Missing mandatory section: ## Appendix A"
  fi
else
  compact_sections=(
    "## 0. Document Control"
    "## 1. Situation and Owner"
    "## 2. Scope"
    "## 3. Constraints and Definition of Done"
    "## 4. Open Items and Handoff"
  )
  for sec in "${compact_sections[@]}"; do
    if ! grep -qF "$sec" "$target_file"; then
      add_error "Missing mandatory section: $sec"
    fi
  done
fi

# 2. C10 Invariant 1: Out of scope present and non-empty
if ! grep -qi '### Out of scope' "$target_file"; then
  add_error "C10 Invariant 1 failed: Missing '### Out of scope' section."
else
  out_lines=$(awk '/### Out of scope/{flag=1; next} /^###/{flag=0} /^##/{flag=0} flag' "$target_file" | grep -v '^[[:space:]]*$' || true)
  if [[ -z "$out_lines" ]]; then
    add_error "C10 Invariant 1 failed: '### Out of scope' section is empty."
  fi
fi

# 3. C10 Invariant 2: Assumptions labeled with impact if wrong
if ! grep -qiE '(impact if wrong|assuming \(untested\))' "$target_file"; then
  add_error "C10 Invariant 2 failed: Assumptions must explicitly tabulate 'Impact if wrong' or 'Assuming (untested)'."
fi

# 4. C10 Invariant 3: Single next action with single accountable owner
if ! grep -qiE 'Next( responsible)? action' "$target_file"; then
  add_error "C10 Invariant 3 failed: Missing 'Next responsible action' statement in Handoff."
fi

# 5. C10 Invariant 4: Change trigger in Document Control
if ! grep -qi 'Next review or change trigger:' "$target_file"; then
  add_error "C10 Invariant 4 failed: Missing 'Next review or change trigger' in Document Control."
fi

# 6. Gate log integrity (Comprehensive)
is_authoritative=0
if echo "$status" | grep -qiE '(decision-ready|approved)'; then
  is_authoritative=1
fi

if [[ "$mechanism" == "comprehensive" && $is_authoritative -eq 1 ]]; then
  for g in "Gate A" "Gate B" "Gate C" "Gate D" "Gate E"; do
    if ! grep -iF "$g" "$target_file" | grep -qi 'pass'; then
      add_error "Baseline $g is missing or did not record Pass status in Gate Log."
    fi
  done
fi

# 7. Placeholder hygiene
if grep -qEi '\[(TBD|TODO|FIXME|INSERT|Initiative Name)(:[^]]*)?\]' "$target_file"; then
  if [[ $is_authoritative -eq 1 ]]; then
    add_error "Placeholder hygiene failure: Document is marked '$status' but contains unresolved placeholders."
  else
    add_warning "Placeholder hygiene warning: Draft contains unresolved placeholders."
  fi
fi

# 8. Scope hash seal check
declared_hash=$(awk -F'Scope hash:[[:space:]]*' 'tolower($0) ~ /scope hash:/ {split($2, a, " "); gsub(/sha256:/, "", a[1]); print tolower(a[1])}' "$target_file" | tr -d '\r')
hash_valid="null"
if [[ -n "$declared_hash" ]]; then
  if [[ "$declared_hash" == "$computed_hash" ]]; then
    hash_valid="true"
  else
    hash_valid="false"
    add_error "Scope Hash Mismatch: Declared '$declared_hash' does not match computed '$computed_hash'."
  fi
elif [[ $require_seal -eq 1 ]]; then
  add_error "Missing required Scope Hash seal in Document Control."
else
  add_warning "Scope Hash seal not present in Document Control (use --seal to compute)."
fi

# Output formatting
if [[ $json_mode -eq 1 ]]; then
  err_json="[]"
  if [[ ${#errors[@]} -gt 0 ]]; then
    err_json=$(printf '%s\n' "${errors[@]}" | awk 'BEGIN{printf "["} {if(NR>1)printf ", "; printf "\"%s\"", $0} END{printf "]"}')
  fi
  warn_json="[]"
  if [[ ${#warnings[@]} -gt 0 ]]; then
    warn_json=$(printf '%s\n' "${warnings[@]}" | awk 'BEGIN{printf "["} {if(NR>1)printf ", "; printf "\"%s\"", $0} END{printf "]"}')
  fi
  is_valid="true"
  [[ ${#errors[@]} -gt 0 ]] && is_valid="false"
  cat <<EOF
{
  "file": "$target_file",
  "valid": $is_valid,
  "mechanism": "$mechanism",
  "status": "$status",
  "errors": $err_json,
  "warnings": $warn_json,
  "hash": "$computed_hash",
  "hash_valid": $hash_valid
}
EOF
  [[ ${#errors[@]} -eq 0 ]] && exit 0 || exit 1
fi

echo "Verifying: $target_file (POSIX Bash fallback engine)"
echo "Mechanism: $(echo "$mechanism" | awk '{print toupper(substr($0,1,1)) substr($0,2)}') | Status: $status"
echo "Computed Hash: ${computed_hash:0:16}..."

if [[ "$hash_valid" == "true" ]]; then
  echo "PASS: Scope Hash seal verified."
elif [[ "$hash_valid" == "false" ]]; then
  echo "FAIL: Scope Hash seal mismatch."
fi

if [[ ${#warnings[@]} -gt 0 ]]; then
  for w in "${warnings[@]}"; do
    echo "WARN: $w"
  done
fi

if [[ ${#errors[@]} -eq 0 ]]; then
  echo -e "\nALL VERIFICATION CHECKS PASSED."
  exit 0
else
  echo -e "\nVERIFICATION FAILED (${#errors[@]} errors):"
  for err in "${errors[@]}"; do
    echo "  - FAIL: $err"
  done
  exit 1
fi
