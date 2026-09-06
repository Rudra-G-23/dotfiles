---
name: change-report
description: Auto-invoke after finishing a non-trivial code change - a new feature, a bug fix, or a refactor. Produces a structured, section-by-section, point-wise completion report (summary, root cause, design decisions, files changed, fix, tests before/after, acceptance criteria, edge cases checked, known limitations, behavior changed, commit). Do not invoke for small work - a single commit, a typo fix, a formatting-only change, a version bump, a config tweak, or other trivial edits.
---

Use this format to report back after completing real implementation work. Do not
wait to be asked - produce this report as the final part of your turn whenever the
trigger conditions below are met. Output goes to chat only - never write it to a
file unless explicitly asked.

## When to use this

Use it for:
- A new feature or capability being implemented
- A bug fix
- A refactor

Skip it for:
- A single commit or small file edit
- A typo, comment, or formatting-only change
- A version or dependency bump with no behavior change
- A config tweak
- Any other trivial edit

When in doubt, judge by size and risk, not by how the task was phrased: if the
change touches program behavior in a way worth explaining to a reviewer, use the
report; if it does not, skip it.

## Output rules

- Structure the report as markdown headers, one per applicable section below, in
  order. Under each header, write bullet points - not prose paragraphs.
- Scale depth to the size of the change. Big feature: use every applicable
  section, in depth. Small fix or minor refactor: condense - merge short
  sections together and cut any that add nothing. Never pad a small change to
  look like a big one, and never force an irrelevant section in just to fill
  the template.
- Omit a section entirely if it does not apply to this change. Exception: Tests
  Before / Tests After - if no suite exists or nothing was run, say so
  explicitly in the section rather than omitting it.
- Be specific: name real files, real line ranges, real test names and counts.
  Do not summarize vaguely when a concrete detail is available.
- Do not fabricate or estimate a metric that wasn't actually measured (e.g.
  token counts a harness doesn't expose) - state plainly that it isn't
  available, rather than guessing.

## Sections

### Summary
- One or two bullets: what changed and why. For a bug fix this is the headline
  symptom; for a feature or refactor this is the goal.

### Root Cause
- Bug fixes only - omit entirely for features and pure refactors.
- Bullet(s) explaining the underlying mechanism that caused the bug, not just
  the symptom.

### Design Decisions
- Features and refactors with real decisions to explain - omit for simple bug
  fixes with nothing to justify.
- Bullets on the approach taken and why (e.g. schema/migration shape, isolation
  strategy, architecture tradeoffs, why this over an alternative).
- Call out anything deliberately left untouched or out of scope, and why.

### Files Changed
- One bullet per file: path, and a one-line description of what changed in it.
  Include line delta (+/-) if available.

### Fix / Implementation
- Bullets describing what was actually done, mechanically - the concrete
  changes, not the reasoning (that's Design Decisions).

### Tests Before
- Pass/fail counts prior to the change, and which specific tests were failing
  (by name), if any.
- If no test suite exists or was run, say so explicitly.

### Tests After
- Pass/fail counts after the change - confirm whether the full suite is green.
- Name the specific test files or cases that exercise the change.

### Acceptance Criteria
- Only include if a formal spec or defined requirements existed for this work
  - omit entirely otherwise.
- Numbered list, each item marked PASS or FAIL against a specific stated
  requirement.

### Edge Cases Checked
- Bullet list of edge cases or adversarial scenarios verified, and the result
  of each - what was found, what was fixed, what was already safe.
- Include cases checked manually or by script outside the automated suite, if
  any.

### Known Limitations
- Bullets naming what is explicitly NOT covered or NOT implemented in this
  pass. Omit only if there truly are none - don't skip this to look complete.

### Behavior Changed
- Bullet list of exactly what behavior is new or different now.
- A bullet confirming what remains unchanged, so the reviewer knows the blast
  radius.

### Follow-ups
- Optional. Anything intentionally deferred, known gaps, or next steps enabled
  by this work. Omit if there are none.

### Commit
- Don't commit unless the user explicitly asked for it in the prompt.
- If committed: commit hash and message, branch name, and whether it has been
  pushed.
- If nothing was committed, say so explicitly.
