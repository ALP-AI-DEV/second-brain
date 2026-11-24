# Operation: onboarding

Synonyms: let's get to know each other, set up the base for me. Offer it yourself if "Who I am" in `AGENTS.md` is empty.

The goal is to give the user a first useful result within a few minutes and create only the sections they
need, not "just in case" ones. **Onboarding never blocks work:** if the user sent a file or a task
right away — do it, and ask the questions afterwards, one at a time.

## Steps

1. **Three questions in one message** (answers can be short, and not all are required):
   1. What do you do, and what do you want the base to help you remember more easily?
   2. What material shall we process first? Drop it into `raw/inbox/` or right here: a meeting, an email,
      a document, a note, an article.
   3. What must not be shared externally — with the second model and cloud services?
2. **Write the answers into "Who I am".** Only what the user said. The other fields (tools,
   second model) you'll ask about later, when they're first needed.
3. **Process the first material** following `operations/ingest.md` and give a useful result: a summary,
   decisions, promises, open questions. There's no section yet — the page goes into `wiki/notes/`,
   sensitive material — into `wiki/personal/`. No material yet — skip steps 3–5, suggest the next
   step (step 6) and finish onboarding.
4. **Propose starting sections** — up to 5, only those that follow from the answers and the material. If
   `notes/` and `personal/` are enough — don't propose any: an unneeded section is worse than a missing one.
   For each one: path, what goes there, synonyms, template, "External", and where today's
   material would go. Example:
   ```
   wiki/clients/    — a folder for each client (template client.md); meeting with X LLC → clients/x/
   wiki/playbooks/  — how I work: procedures, checklists, good templates
   ```
   You can look at `examples/` and `templates/` for ideas, but don't copy someone else's structure wholesale:
   a section should answer what the user will actually be looking for.
5. **After a "yes"** — follow `operations/restructure.md`: create the folders, add lines to the section map
   (`wiki/index.md`), move from `notes/` what you listed in the proposal, and write a log entry
   `## [YYYY-MM-DD] onboarding | sections: …`. Update `wiki/overview.md`.
6. **Suggest the next step** in one line: what else to drop in, which commands to try
   ("prepare me for the meeting with …", "what did I promise and not deliver?", "check the base").

## If onboarding didn't happen

The user skipped the questions and just works — process the materials, filing them without a section
in `notes/`. Once 3+ pages of the same kind pile up there, or long-running work begins
(a client, project, course), propose a section — that's onboarding in installments.
