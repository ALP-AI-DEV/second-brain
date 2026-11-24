# Operation: lint

Synonyms: lint, check the base, audit. Once a week or on request.

## First — mechanical checks

These can be done with commands (`ls`, `find`, `wc -c`), so they don't depend on attentiveness:

1. **Structure against the map.** For every line of the section map (`wiki/index.md`) the folder must
   exist, at any depth. Every top-level folder in `wiki/` must be in the map;
   nested folders (subsections, entities, `_raw/`, `drafts/`) don't need a line of their own.
2. **Instruction size.** `wc -c` of the root `AGENTS.md` (limit 7 500 bytes) and the total of the
   AGENTS.md chain down to the deepest folder (limit 14 000 bytes).
3. **Notes.** Pages in `wiki/notes/` older than 4 weeks; groups on one topic are candidates
   for a section (the `candidate:` field).
4. **Drafts.** Files in `drafts/` older than 3 weeks: path, age, the gist in one line, signs that it's
   closed (the outcome is in `decisions.md` / `timeline.md`, whether it was sent outside).

## Then — by meaning

5. **Contradictions** — different pages say different things about the same subject
6. **Orphans** — pages nobody links to
7. **Broken links** — `[[name]]` points to a file that doesn't exist
8. **Missing links** — a topic is mentioned, but there's no link
9. **Duplicates** — two pages about the same thing
10. **Stuck items** — open questions and promises with no movement for a long time
11. **Misplaced** — sensitive material outside `personal/` and sections marked "External: no"
12. 3 questions or topics worth researching

Format for each finding:
```
PROBLEM: what
WHERE: file
WHAT TO DO: action
PRIORITY: high / medium / low
```

**Don't fix or delete anything yourself — report only. The user makes the decisions.**
For the drafts, ask about each one: finish / delete / keep. Whatever was sent outside is not deleted
but moved to `drafts/old-versions/`. Not drafts and not to be touched: agents' prompts,
everything in `_raw/`, signed documents.

After the report — a cross-check by a second model (also report only); merge the results:
"found by me / found by the second model / we disagree". A log entry: `## [YYYY-MM-DD] lint | outcome`.
