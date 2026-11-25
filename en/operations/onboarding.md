# Operation: onboarding

Synonyms: let's get to know each other, set up the base for me. Offer it yourself if "Who I am" in
`AGENTS.md` is empty. A partly filled "Who I am" is no reason to start the questionnaire again.

The goal is to give the user a first useful result within a few minutes and create only the sections they
need, not "just in case" ones. **Onboarding never blocks work:** if the user sent a file or a task
right away — do it, and ask the questions afterwards. Onboarding succeeds even without new sections,
a filled-in profile or a connected second model.

## Steps

1. **Three questions in one message.** Precede them with one line: "Short answers are fine, so is
   skipping some or just sending material. Prefer one question at a time — say so." Don't re-ask what
   the user has already told you.
   1. What do you do, and what do you want the base to help you remember more easily? (Example answer:
      "I run a sales team and want to remember what I promised clients.")
   2. What material shall we process first? Drop it into `raw/inbox/` or right here: a meeting, an email,
      a document, a note, an article.
   3. What must not be shared externally — with the second model and cloud services?
2. **Write the answers into "Who I am".** Only what the user said; you may condense, not change the
   meaning. A skipped question leaves the field empty: that's neither "no" nor permission. A fact from
   the material is a fact about the material: a client meeting doesn't tell you what the user does for
   a living. The other fields (tools, second model) you'll ask about when they're first needed.
3. **Process the first material** following `operations/ingest.md` and show a useful result: a summary,
   decisions, promises, open questions, where it was saved — and one question the base can now answer
   ("what should I prepare for the next meeting with …?"). There's no section yet — the page goes into
   `wiki/notes/` (a long-running story — as an entity folder inside `notes/`), sensitive material — into
   `wiki/personal/`. The second model isn't set up yet — don't hold back the result: show it marked "not
   cross-checked by a second model" and offer the setup in one line later.
   No material yet — skip steps 3–5 and go to step 6.
4. **Clarify only if the answer changes the structure plan** — one round, 1–2 questions, each with a
   recommendation and the reason (format — `operations/deep-setup.md`). For example:
   ```
   ❓ 1. Keep further meetings with X in one history?
   ➡️ I suggest yes: the material already has a next step and promises.
   ```
   Nothing to clarify — skip this step.
5. **Propose starting sections** — up to 5, only those that follow from the answers and the material. If
   `notes/` and `personal/` are enough — don't propose any: an unneeded section is worse than a missing one.
   For each one: path, what goes there, synonyms, template, "External", and where today's
   material would go. Example:
   ```
   wiki/clients/    — a folder for each client (template client.md); meeting with X LLC → clients/x/
   wiki/playbooks/  — how I work: procedures, checklists, good templates
   ```
   You can look at `examples/` and `templates/` for ideas, but don't copy someone else's structure wholesale.
   One question: "Shall I carry out this plan?" After a "yes" — follow `operations/restructure.md`: create the
   folders, add lines to the section map (`wiki/index.md`), move from `notes/` what you listed, update
   `wiki/overview.md`.
6. **Offer how to go on** — two options to choose from:
   - **Get to work:** drop in more material, try "prepare me for the meeting with …", "what did I promise
     and not deliver?".
   - **"Let's set up the base in depth"** (or "grill me") — 10–20 minutes of questions in rounds. The agent
     learns how you work, who and what you keep track of, what matters to remember — and tunes the
     sections and rules. Worth it if the base becomes your main work tool.

   Wait for the choice. "Get to work" — write `postponed YYYY-MM-DD` into "Who I am" → "In-depth setup".
   "In depth" — run `operations/deep-setup.md`; it sets `done` itself. No answer — leave the status as is.
   Log entry: `## [YYYY-MM-DD] onboarding | sections: … (or "no sections")`.

## "Stop", "take it from here", skipped answers

- **"Stop", "later"** — stop asking. The base stays as it is; recommendations aren't applied without a "yes".
- **"Take it from here"** — do what's already allowed (processing material). New sections — only by a plan
  that was shown and agreed.
- **A skipped answer** is neither consent nor permission to share externally.

## If onboarding didn't happen

The user skipped the questions and just works — process the materials, filing them without a section
in `notes/`. Once 3+ pages of the same kind pile up there, or long-running work begins
(a client, project, course), propose a section — that's onboarding in installments.
