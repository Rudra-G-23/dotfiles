---
name: change-report
description: Auto-invoke after finishing a non-trivial code change - a new feature, a bug fix, or a refactor. Produces a structured, section-by-section, point-wise completion report (root cause, files changed, fix, tests before/after, edge cases checked, behavior changed, commit). Do not invoke for small work - a single commit, a typo fix, a formatting-only change, a version bump, a config tweak, or other trivial edits.
---

Use this format to report back after completing real implementation work. Do not wait to be asked - produce this report as the final part of your turn whenever the trigger conditions below are met.

## When to use this

Use it for:
- A new feature or capability being implemented
- A bug fix
- A refactor

Skip it for:
- A single commit or small file edit
- A typo, comment, or formatting-only change
- A version bump or dependency bump with no behavior change
- A config tweak
- Any other trivial edit

When in doubt, judge by size and risk, not by how the task was phrased: if the change touches program behavior in a way worth explaining to a reviewer, use the report; if it does not, skip it.

## Output rules

- Structure the report as markdown headers, one per section below, in order.
- Under each header, write bullet points - do not write prose paragraphs.
- Omit a section entirely if it does not apply (say so with one bullet, do not force empty sections in). Do not fabricate content for a section that does not apply.
- Be specific: name real files, real line ranges, real test names and counts. Do not summarize vaguely when a concrete detail is available.

## Sections

### Summary
- One or two bullets: what changed and why. For a bug fix this is the headline symptom; for a feature or refactor this is the goal.

### Root Cause
- Bug fixes only - omit this section entirely for features and pure refactors.
- Bullet(s) explaining the underlying mechanism that caused the bug, not just the symptom.

### Files Changed
- One bullet per file: path, and a one-line description of what changed in it.

### Fix / Implementation
- Bullet points describing what was actually done and the key decisions made.
- Call out anything deliberately left untouched or out of scope, and why.

### Tests Before
- Pass/fail counts prior to the change, and which specific tests were failing (by name), if any.
- If no test suite exists or was run, say so explicitly instead of omitting the section.

### Tests After
- Pass/fail counts after the change - confirm whether the full suite is green.
- Name the specific test files or cases that exercise the change.

### Edge Cases Checked
- Bullet list of edge cases or adversarial scenarios verified, and the result of each.
- Include cases checked manually/by script outside the automated suite, if any.

### Behavior Changed
- Bullet list of exactly what behavior is new or different now.
- A bullet confirming what remains unchanged, so the reviewer knows the blast radius.

### Follow-ups (optional)
- Anything intentionally deferred, known gaps, or next steps. Omit if there are none.

### Commit
- Don't commit if user explictly not said in prompt.
- Commit hash and message, branch name, and whether it has been pushed.
- If nothing was committed, say so explicitly.
