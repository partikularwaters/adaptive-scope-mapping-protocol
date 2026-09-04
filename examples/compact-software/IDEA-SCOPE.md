# Scope Brief — Team Standup Notes Widget

## 0. Document Control
- Status: Decision-ready
- Scope owner: Jordan Lee, Engineering Lead
- Accountable decision-maker: Jordan Lee
- Prepared on: 2026-08-10
- Next review or change trigger: If the widget needs cross-team data or external API access
- Completion check: passed

## 1. Situation and Owner
- Current situation: The internal team dashboard shows build status and on-call rotation but has no place for standup notes. Notes live in a shared doc that people forget to update.
- Problem or opportunity: Standup context is scattered; the dashboard is already the daily check-in surface.
- Desired change: A read-only widget on the existing dashboard that shows each team member's latest standup note (yesterday / today / blocker).
- Why now: Three new engineers joined; onboarding highlighted the friction.
- Consequence of no action: Notes stay in the shared doc; dashboard remains incomplete as a team hub.
- Primary beneficiary: Members of the Platform team (8 people) who run daily standups.
- Accountable decision-maker: Jordan Lee
- Other materially relevant roles: None material to scope decisions.

## 2. Scope
### In scope
- Read-only widget embedded in the existing internal dashboard
- Display latest standup note per team member (three fields: yesterday, today, blocker)
- Data sourced from the team's existing standup form (already in use)
- Responsive layout consistent with current dashboard cards

### Conditional
- "Edit in form" link — included only if the form supports deep links (still need to check with form owner)

### Out of scope
- Replacing the standup form
- Notifications or reminders
- Cross-team or manager rollup views
- Mobile-native app; mobile browser is sufficient

### External dependencies
- Standup form API or export — owned by Internal Tools; Jordan to confirm read access by 2026-08-12

## 3. Constraints and Definition of Done
### Constraints and assumptions
- **Known** — Widget must use existing dashboard component library (design review not required; pattern already established).
- **Known** — Must deploy through existing CI pipeline; no new hosting.
- **Assuming (untested)** — Standup form data refreshes at least hourly. If wrong, widget may show stale notes; validate with Internal Tools before build starts.
- **Still need to check** — Whether form API supports per-user latest-record query without a new backend endpoint.

### End-to-end scenario
Given a Platform engineer opens the internal dashboard on a weekday morning, they see a "Standup Notes" card listing each teammate's most recent standup entry with yesterday, today, and blocker fields populated from the form, without leaving the dashboard.

### Observable acceptance evidence
- Jordan and two other engineers confirm the card shows correct data for a real standup day.
- Widget loads within existing dashboard performance budget (under 2s on office network).

### Material edge or failure scenario
If the form API is unavailable, the widget shows a clear "standup data unavailable" state rather than empty or misleading rows.

## 4. Open Items and Handoff
### Open and deferred items
- **Still need to check** — Form API read access and query shape — Internal Tools contact — due 2026-08-12 — blocks implementation start
- **Still need to check** — Deep link to form — form owner — due 2026-08-14 — blocks "Edit in form" link only

### Handoff
- Next action: Confirm form API access and query capabilities with Internal Tools
- Owner: Jordan Lee
- Receiving person, discipline, or protocol: Engineering implementation (small feature ticket in existing repo)
- Expected next output: Implementation task with API contract attached
- Approved redirection or fit limitation, if any: None
