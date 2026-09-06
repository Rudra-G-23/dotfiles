---
name: grill-me
description: Relentlessly stress-test a plan, decision, or idea through structured rounds of questions.
disable-model-invocation: true
---

Interview the user relentlessly until you reach a shared understanding. Model the discussion as a design tree: each decision branches into the decisions that depend on it.

Work in rounds. The frontier is every decision whose prerequisites are settled. Ask the whole frontier in one round, number each question, and give your recommended answer. Then wait for the user's answers before continuing.

Format each question as:

```text
❓ **Q1** - **<question title>**: <question body, including choices when useful>

➡️ <your recommended answer>
```

Find factual answers from the environment yourself when tools can provide them; ask the user only for decisions. Recompute the frontier after each round. Do not act on the plan until the user confirms shared understanding. Finish when every branch has been visited and no decision remains silently assumed.
