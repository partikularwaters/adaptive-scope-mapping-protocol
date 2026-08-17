# Scope Brief — Team Standup Notes Widget

## 0. Document Control
- Status: Decision-ready
- Scoping mechanism: ASMP Compact
- Scope owner: Jordan Lee, Engineering Lead
- Accountable decision-maker: Jordan Lee
- Prepared on: 2026-08-10
- Next review or change trigger: If the widget needs cross-team data or external API access

## 1. Purpose and Current Reality
- Current situation: The internal team dashboard shows build status and on-call rotation but has no place for standup notes. Notes live in a shared doc that people forget to update.
- Problem or opportunity: Standup context is scattered; the dashboard is already the daily check-in surface.
- Desired change: A read-only widget on the existing dashboard that shows each team member's latest standup note (yesterday / today / blocker).
- Why now: Three new engineers joined; onboarding highlighted the friction.
- Consequence of no action: Notes stay in the shared doc; dashboard remains incomplete as a team hub.

## 2. Primary Person and Owner
- Primary beneficiary: Members of the Platform team (8 people) who run daily standups.
- Accountable decision-maker: Jordan Lee
- Other materially relevant roles: None material to scope decisions.

## 3. Scope
### In scope
- Read-only widget embedded in the existing internal dashboard
- Display latest standup note per team member (three fields: yesterday, today, blocker)
- Data sourced from the team's existing standup form (already in use)
- Responsive layout consistent with current dashboard cards

### Conditional
- "Edit in form" link — included only if the form supports deep links (Open — verification with form owner)

### Out of scope
- Replacing the standup form
- Notifications or reminders
- Cross-team or manager rollup views
- Mobile-native app; mobile browser is sufficient

### External dependencies
- Standup form API or export — owned by Internal Tools; Jordan to confirm read access by 2026-08-12

## 4. Constraints and Assumptions
- **Confirmed** — Widget must use existing dashboard component library (design review not required; pattern already established).
- **Confirmed** — Must deploy through existing CI pipeline; no new hosting.
- **Assumption** — Standup form data refreshes at least hourly. If wrong, widget may show stale notes; validate with Internal Tools before build starts.
- **Open** — Whether form API supports per-user latest-record query without a new backend endpoint.

## 5. Definition of Done
### End-to-end scenario
Given a Platform engineer opens the internal dashboard on a weekday morning, they see a "Standup Notes" card listing each teammate's most recent standup entry with yesterday, today, and blocker fields populated from the form, without leaving the dashboard.

### Observable acceptance evidence
- Jordan and two other engineers confirm the card shows correct data for a real standup day.
- Widget loads within existing dashboard performance budget (under 2s on office network).

### Material edge or failure scenario
If the form API is unavailable, the widget shows a clear "standup data unavailable" state rather than empty or misleading rows.

## 6. Open and Deferred Items
- **Open** — Form API read access and query shape — Internal Tools contact — due 2026-08-12 — blocks implementation start
- **Open** — Deep link to form — form owner — due 2026-08-14 — blocks "Edit in form" link only

## 7. Completion Check
- Evidence checked: Existing dashboard and form usage observed; API docs not yet reviewed (noted as Open).
- Real example used: Tuesday standup for Platform team, 8 members.
- Consistency result: Purpose, beneficiary, boundary, and DoD align.
- Open-item result: Two Open items with owners and dates; neither disguised as Confirmed.

## 8. Handoff
- Next action: Confirm form API access and query capabilities with Internal Tools
- Owner: Jordan Lee
- Receiving person, discipline, or protocol: Engineering implementation (small feature ticket in existing repo)
- Expected next output: Implementation task with API contract attached
- Approved redirection or fit limitation, if any: None
