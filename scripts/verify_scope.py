#!/usr/bin/env python3
"""
ASMP Scope Verifier (Python standard library implementation)
Validates IDEA-SCOPE.md files against ASMP contracts, C10 invariants, gate resolution,
placeholder hygiene, and canonical SHA-256 tamper-evident hash seals.
"""

import sys
import re
import hashlib
import json
import argparse
from pathlib import Path

PLACEHOLDER_PATTERN = re.compile(r'\[(TBD|TODO|FIXME|INSERT|Initiative Name)(?::[^\]]*)?\]', re.IGNORECASE)

COMPREHENSIVE_SECTIONS = [
    "## 0. Document Control",
    "## 1. Executive Frame",
    "## 2. Current Reality and Intent",
    "## 3. People, Roles, and Impact",
    "## 4. Outcomes and Guardrails",
    "## 5. Domain Model and Vocabulary",
    "## 6. Scope and Boundaries",
    "## 7. Sequence",
    "## 8. Constraints and Operating Context",
    "## 9. Assumptions",
    "## 10. Dependencies",
    "## 11. Risks and Responses",
    "## 12. Approach Boundaries",
    "## 13. Definition of Done and Acceptance",
    "## 14. Governance and Change",
    "## 15. Decision Register",
    "## 16. Open and Deferred Items",
    "## 17. Gate Log",
    "## 18. Handoff",
    "## Appendix A"
]

COMPACT_SECTIONS = [
    "## 0. Document Control",
    "## 1. Situation and Owner",
    "## 2. Scope",
    "## 3. Constraints and Definition of Done",
    "## 4. Open Items and Handoff"
]

def canonical_normalize(content: str) -> str:
    """Normalize content for reproducible hashing by excluding the Scope hash line."""
    lines = []
    for line in content.splitlines():
        # Exclude any existing Scope hash line from the hash calculation
        if re.match(r'^\s*[-*]?\s*Scope hash\s*:', line, re.IGNORECASE):
            continue
        lines.append(line.rstrip())
    # Join with standard newlines and strip excessive trailing newlines
    normalized = "\n".join(lines).strip() + "\n"
    return normalized

def compute_scope_hash(content: str) -> str:
    normalized = canonical_normalize(content)
    return hashlib.sha256(normalized.encode('utf-8')).hexdigest()

def detect_mechanism(content: str) -> str:
    if "## 18. Handoff" in content or "ASMP Comprehensive" in content:
        return "comprehensive"
    if "## 4. Open Items and Handoff" in content or "ASMP Compact" in content:
        return "compact"
    return "comprehensive"  # Default assumption

def extract_section(content: str, heading: str) -> str:
    pattern = re.compile(rf'^{re.escape(heading)}.*$', re.MULTILINE)
    match = pattern.search(content)
    if not match:
        return ""
    start = match.end()
    # Find next section heading of equal or higher level (##)
    next_match = re.search(r'^##\s+', content[start:], re.MULTILINE)
    if next_match:
        end = start + next_match.start()
        return content[start:end].strip()
    return content[start:].strip()

def verify_scope(file_path: Path, require_seal: bool = False):
    errors = []
    warnings = []
    
    if not file_path.exists():
        return {
            "file": str(file_path),
            "valid": False,
            "errors": [f"File not found: {file_path}"],
            "warnings": [],
            "mechanism": "unknown",
            "hash": None,
            "hash_valid": False
        }
        
    try:
        content = file_path.read_text(encoding="utf-8")
    except Exception as e:
        return {
            "file": str(file_path),
            "valid": False,
            "errors": [f"Could not read file: {e}"],
            "warnings": [],
            "mechanism": "unknown",
            "hash": None,
            "hash_valid": False
        }
        
    mechanism = detect_mechanism(content)
    computed_hash = compute_scope_hash(content)
    
    # 1. Check Document Control status
    status_match = re.search(r'[-*]?\s*Status:\s*([^\n]+)', content, re.IGNORECASE)
    status = status_match.group(1).strip() if status_match else "Draft"
    is_authoritative = any(s in status.lower() for s in ["decision-ready", "approved"])
    
    # 2. Check Mandatory Sections
    expected_sections = COMPREHENSIVE_SECTIONS if mechanism == "comprehensive" else COMPACT_SECTIONS
    for sec in expected_sections:
        prefix = sec.split()[0] + " " + sec.split()[1] # e.g. "## 0." or "## Appendix"
        if not re.search(rf'^{re.escape(prefix)}', content, re.MULTILINE):
            errors.append(f"Missing mandatory section: {sec}")
            
    # 3. Check C10 Invariant 1: Out of scope section present and non-empty
    out_of_scope_match = re.search(r'###\s+Out of scope[^\n]*\n([\s\S]*?)(?=\n###|\n##|\Z)', content, re.IGNORECASE)
    if not out_of_scope_match:
        errors.append("C10 Invariant 1 failed: Missing '### Out of scope' section.")
    else:
        out_content = out_of_scope_match.group(1).strip()
        # Remove markdown comments
        out_content = re.sub(r'<!--[\s\S]*?-->', '', out_content).strip()
        if not out_content or out_content.lower() in ["none", "none.", "n/a", "tbd"]:
            errors.append("C10 Invariant 1 failed: '### Out of scope' section is empty or unpopulated.")
            
    # 4. Check C10 Invariant 2: Assumptions labeled with impact if wrong
    assumptions_sec = extract_section(content, "## 9. Assumptions") if mechanism == "comprehensive" else extract_section(content, "## 3. Constraints and Definition of Done")
    if not assumptions_sec:
        errors.append("C10 Invariant 2 failed: Missing Assumptions section.")
    else:
        has_impact_label = bool(re.search(r'impact if wrong|assuming \(untested\)', assumptions_sec, re.IGNORECASE))
        if not has_impact_label:
            errors.append("C10 Invariant 2 failed: Assumptions must explicitly tabulate 'Impact if wrong' or 'Assuming (untested)'.")
            
    # 5. Check C10 Invariant 3: Exactly ONE next action with ONE named owner
    handoff_sec = extract_section(content, "## 18. Handoff") if mechanism == "comprehensive" else extract_section(content, "## 4. Open Items and Handoff")
    if not handoff_sec:
        errors.append("C10 Invariant 3 failed: Missing Handoff section.")
    else:
        next_action_match = re.search(r'[-*]?\s*Next(?: responsible)? action[^:]*:\s*([^\n]+)', handoff_sec, re.IGNORECASE)
        owner_match = re.search(r'[-*]?\s*(?:Action )?Owner[^:]*:\s*([^\n]+)', handoff_sec, re.IGNORECASE)
        
        if not next_action_match or not next_action_match.group(1).strip():
            errors.append("C10 Invariant 3 failed: Missing 'Next responsible action' statement.")
        else:
            action_val = next_action_match.group(1).strip()
            if action_val.lower() in ["tbd", "todo", "none"]:
                errors.append(f"C10 Invariant 3 failed: Next responsible action is unassigned ('{action_val}').")
                
        if not owner_match or not owner_match.group(1).strip():
            errors.append("C10 Invariant 3 failed: Missing 'Owner' in handoff.")
        else:
            owner_val = owner_match.group(1).strip()
            if owner_val.lower() in ["the team", "team", "everyone", "tbd", "todo"]:
                errors.append(f"C10 Invariant 3 failed: Next action owner must be a specific accountable role/person, not '{owner_val}'.")
                
    # 6. Check C10 Invariant 4: Change trigger stated in Document Control
    doc_control = extract_section(content, "## 0. Document Control")
    if not doc_control:
        errors.append("Missing Document Control section.")
    else:
        trigger_match = re.search(r'[-*]?\s*Next review or change trigger:\s*([^\n]+)', doc_control, re.IGNORECASE)
        if not trigger_match or not trigger_match.group(1).strip() or trigger_match.group(1).strip().lower() in ["tbd", "none"]:
            errors.append("C10 Invariant 4 failed: Missing or unpopulated 'Next review or change trigger' in Document Control.")

    # 7. Check Gate Log integrity (Comprehensive only)
    if mechanism == "comprehensive" and is_authoritative:
        gate_sec = extract_section(content, "## 17. Gate Log")
        if not gate_sec:
            errors.append("Comprehensive scope marked Decision-ready/Approved is missing Section 17 Gate Log.")
        else:
            for gate_name in ["Gate A", "Gate B", "Gate C", "Gate D", "Gate E"]:
                gate_row = re.search(rf'{gate_name}[^|\n]*\|[^|\n]*\|([^|\n]+)', gate_sec, re.IGNORECASE)
                if not gate_row:
                    errors.append(f"Gate Log missing evaluation for Baseline {gate_name}.")
                else:
                    gate_status = gate_row.group(1).strip().lower()
                    if "pass" not in gate_status:
                        errors.append(f"Baseline {gate_name} did not pass in Gate Log (Status: '{gate_row.group(1).strip()}'). Document cannot be marked {status}.")

    # 8. Check Placeholder Hygiene
    placeholders = PLACEHOLDER_PATTERN.findall(content)
    if placeholders:
        msg = f"Unresolved placeholders detected ({len(placeholders)} instances, e.g., [{placeholders[0]}])."
        if is_authoritative:
            errors.append(f"Placeholder hygiene failure: Document is marked '{status}' but contains unresolved placeholders.")
        else:
            warnings.append(f"Placeholder hygiene warning (Draft): {msg}")
            
    # 9. Check Option 2A Hash Seal
    existing_hash_match = re.search(r'[-*]?\s*Scope hash\s*:\s*(?:sha256:)?([a-fA-F0-9]{64})', content, re.IGNORECASE)
    hash_valid = None
    if existing_hash_match:
        declared_hash = existing_hash_match.group(1).lower()
        if declared_hash == computed_hash.lower():
            hash_valid = True
        else:
            hash_valid = False
            errors.append(f"Scope Hash Mismatch: Declared '{declared_hash[:12]}...' does not match computed '{computed_hash[:12]}...'. Content modified since sealed.")
    elif require_seal:
        errors.append("Missing required Scope Hash seal in Document Control.")
    else:
        warnings.append("Scope Hash seal not present in Document Control (use --seal to compute).")
        
    return {
        "file": str(file_path),
        "valid": len(errors) == 0,
        "mechanism": mechanism,
        "status": status,
        "errors": errors,
        "warnings": warnings,
        "hash": computed_hash,
        "hash_valid": hash_valid
    }

def main():
    parser = argparse.ArgumentParser(description="ASMP Scope Verifier")
    parser.add_argument("file", help="Path to IDEA-SCOPE.md file")
    parser.add_argument("--json", action="store_true", help="Output results in JSON format")
    parser.add_argument("--seal", action="store_true", help="Compute canonical SHA-256 seal and print seal line")
    parser.add_argument("--apply-seal", action="store_true", help="Inject or update Scope hash into Document Control of the file")
    parser.add_argument("--require-seal", action="store_true", help="Require Scope hash seal to be present and valid")
    
    args = parser.parse_args()
    target_path = Path(args.file)
    
    if args.seal:
        if not target_path.exists():
            print(f"Error: {target_path} not found.", file=sys.stderr)
            sys.exit(1)
        content = target_path.read_text(encoding="utf-8")
        h = compute_scope_hash(content)
        print(f"- Scope hash: sha256:{h}")
        sys.exit(0)
        
    if args.apply_seal:
        if not target_path.exists():
            print(f"Error: {target_path} not found.", file=sys.stderr)
            sys.exit(1)
        content = target_path.read_text(encoding="utf-8")
        h = compute_scope_hash(content)
        seal_line = f"- Scope hash: sha256:{h}"
        if re.search(r'[-*]?\s*Scope hash\s*:[^\n]+', content, re.IGNORECASE):
            new_content = re.sub(r'[-*]?\s*Scope hash\s*:[^\n]+', seal_line, content, count=1)
        else:
            # Insert into Document Control after Status line
            new_content = re.sub(r'(## 0\. Document Control\s*\n(?:[-*][^\n]+\n)*)', rf'\1{seal_line}\n', content, count=1)
        target_path.write_text(new_content, encoding="utf-8")
        print(f"Applied seal to {target_path}: {seal_line}")
        sys.exit(0)

    result = verify_scope(target_path, require_seal=args.require_seal)
    
    if args.json:
        print(json.dumps(result, indent=2))
        sys.exit(0 if result["valid"] else 1)
        
    print(f"Verifying: {target_path}")
    print(f"Mechanism: {result['mechanism'].capitalize()} | Status: {result.get('status', 'Unknown')}")
    print(f"Computed Hash: {result['hash'][:16]}...")
    
    if result["hash_valid"] is True:
        print("PASS: Scope Hash seal verified.")
    elif result["hash_valid"] is False:
        print("FAIL: Scope Hash seal mismatch.")
        
    if result["warnings"]:
        for w in result["warnings"]:
            print(f"WARN: {w}")
            
    if result["valid"]:
        print("\nALL VERIFICATION CHECKS PASSED.")
        sys.exit(0)
    else:
        print(f"\nVERIFICATION FAILED ({len(result['errors'])} errors):")
        for err in result["errors"]:
            print(f"  - FAIL: {err}")
        sys.exit(1)

if __name__ == "__main__":
    main()
