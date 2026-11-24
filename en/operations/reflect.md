# Operation: reflect

Synonyms: reflect, how is the base doing, what to improve. Roughly every 20 ingests or on request.

Lint fixes the content; reflect fixes the rules themselves: the schema, the templates, the section structure.
This is how the base grows together with the user.

1. **Sections.** Which grow fastest — is it time to split them? Which stay empty or
   overlap — is it time to merge them? Do the synonyms in the map reflect what the user
   actually calls things?
2. **Notes.** What is piling up in `wiki/notes/` — which section does it call for?
3. **Pages.** Which should be split or merged? Which topics are mentioned but have no page of their own?
4. **Templates.** Do they work? Is a new entity kind (`kind:`) or page type needed?
5. **Schema.** Have `AGENTS.md` and the nested instructions grown too big (limits — in the root's
   "Schema size" section)? What should move to `operations/` or templates, and what should be
   deleted as outdated?
   Which rules did the user repeat in chats that aren't in the schema?
6. 1–2 concrete improvements to the schema, with the ready text of the edit.

**Don't change anything yourself — analysis only.** Structure changes after agreement go through
`operations/restructure.md`; schema edits — after a "yes". After the analysis — a cross-check by a second model;
the result is merged. A log entry: `## [YYYY-MM-DD] reflect | outcome`.
