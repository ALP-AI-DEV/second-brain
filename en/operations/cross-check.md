# Cross-check by a second model

A model is bad at spotting its own mistakes, while another model — especially from another vendor — often catches them
on the first pass.

## When

**Required:**
- a substantive ingest — a new page with real content or meaningful edits in more than
  one file (`index.md` and `log.md` don't count);
- lint, reflect;
- a query answer saved as a page linking to 2+ sources.

**Can be skipped:** a recipe, one line in a catalog, an edit to one paragraph after the user
has checked it.

**Sensitive data** (medical, personal financial, passport data, private correspondence, other people's
trade secrets, everything from `personal/` and sections marked "External: no") may be given to the second model
only as allowed in "Who I am" → "What may be shared externally". If it isn't specified — ask, or offer
to anonymize. A second model launched from the base folder can read any file: in the task,
list explicitly which files it should look at and which it must not.

## How

1. Finish all edits.
2. Give the second model a **read-only** task: what the operation was; the list of created and
   changed files; where the originals are; what to look for — accuracy of the summary against the original,
   missed promises and deadlines, mix-ups of "who said what", distorted numbers and dates, broken
   `[[links]]`, schema violations. Answer format: **Critical / Important / Optional**.
   - How to run it — "Who I am" → "Second model for cross-checks". Usually it's another model's CLI
     run from the base folder (for example, `codex exec`, `gemini -p`, `claude -p`).
   - No CLI — save the task as a file outside the base and ask the user to paste it into another
     model's chat together with the changed files.
3. **Verify each finding yourself against the original** — the second model makes mistakes too.
4. **The mode of the original operation still applies.** After an ingest, fix facts (numbers, dates, names,
   links, schema) yourself, and put questions of meaning (where to put something, how to read a decision) to the
   user. After a lint or reflect — don't fix anything, only a merged report.
5. **One pass per operation.** Don't run it again after the fixes.
6. In the report, separate: "fixed myself" / "needs your decision".
