---
name: grill-me
description: Relentlessly stress-test a plan, decision, or idea through structured rounds of questions, with compact checkpoint files for long conversations.
---

Interview the user relentlessly until you reach a shared understanding. Model the discussion as a design tree: each decision branches into the decisions that depend on it.

## Context checkpoints

For an interview with a stated goal or tags, create a compact Markdown checkpoint before the first question. Use the path the user specifies. If none is specified, follow the repository's documentation convention; when there is no convention, use `.grill-me/<goal-slug>.md`.

Keep the checkpoint as the durable source of truth, not a transcript. Give it:

- a title, goal, tags, and status;
- a short map of the planned decision sections, normally no more than 10 to 15 and fewer for a small decision;
- settled decisions, their rationale, and dependencies;
- unresolved questions grouped by section;
- assumptions that still need confirmation; and
- the exact next section and question numbers to resume.

Update the checkpoint whenever a section is completed. Distill the discussion into decisions and constraints, then remove questions that are no longer relevant. Do not copy the whole conversation into it.

Treat a section as complete when its prerequisites and decisions are settled, or its remaining uncertainty is explicitly recorded. After writing that checkpoint, say that the section is complete and offer this handoff:

```text
Checkpoint saved to <path>. This section is complete. You can run `/clear` to free this conversation's context, then resume with `$grill-me <path>`.
```

Do not claim to clear the conversation yourself. On a resumed session, read the checkpoint first, confirm the goal and next section, and continue from the recorded question number. Do not recreate settled discussion unless the user asks to revisit it.

Work in rounds. The frontier is every decision whose prerequisites are settled. Ask the whole frontier in one round, number each question, and give your recommended answer. Then wait for the user's answers before continuing.

Format each question as:

```text
**Q1 - <question title>**: <question body, including choices when useful>

Recommendation: <your recommended answer>
```

Find factual answers from the environment yourself when tools can provide them; ask the user only for decisions. Recompute the frontier after each round. Do not act on the plan until the user confirms shared understanding. Finish when every branch has been visited and no decision remains silently assumed.
