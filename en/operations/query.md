# Operation: query

Synonyms: question, find, what do we know about, tell me about, prepare me for …

- Start with `wiki/index.md`, then search `wiki/`. Check details against the related
  originals in `_raw/` and `raw/assets/`. `raw/inbox/` is not processed yet. `examples/` and `templates/`
  are not the base: don't use them in answers about the user's affairs.
- Answer from the base and add `[[links]]` to the sources.
- If something isn't in the base, say so; mark answers from general knowledge with "⚠️ not from the base".
- Suggest what to put into `raw/inbox/` to close the gap.
- At the end ask: "Save the answer as a page?" If yes — template `templates/insight.md`,
  a line in the catalog and the log. A page linking to 2+ sources is a substantive operation and
  needs a cross-check by a second model.

## Common requests

- **"Prepare me for the meeting with X"** — the entity's `AGENTS.md`, `profile.md`, plus `timeline.md`,
  `decisions.md` and the latest transcript, if they exist. Answer: who will be there and what matters about them; what we promised and what the
  other side promised (done / not done); open questions; red zones; what to propose at the meeting.
- **"What did I promise and not deliver?"** — all `decisions.md` files in `wiki/`: unfinished (⏳) items
  in the "We promised" section and those where the user is the one responsible. Separately: overdue, with a deadline,
  without a deadline. Other people's promises don't go here (they belong under "where are things stuck"). Take today's
  date from the system, not from the files.
- **"Where are things stuck?"** — open questions and promises across all entities: whose court the ball is in, how long it's been waiting.
