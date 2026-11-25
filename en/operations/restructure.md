# Operation: restructure sections

Synonyms: create a section, move, rename, merge, split a section.

Links to non-unique files (AGENTS, profile, timeline, decisions) use the path from the root,
so any move silently breaks them. Hence the rule: **the structure changes only through this operation,
never along the way during an ingest.** Via a messenger or in the background — it doesn't change at all: material
goes into `wiki/notes/` (sensitive material — into `wiki/personal/`), and the section is proposed when
the user comes back to the agent.

**Look first, then ask.** Read the map and the affected files. If decisions that change the plan are
still open (what to call it, what to merge, which "External" mark), ask one round of questions with
recommendations (format — `operations/deep-setup.md`). A simple move needs no questions.

**One plan — one consent.** Show the plan in your reply, not as a separate file. Before asking, put together the whole plan: what gets created, what moves where,
which files and lines will need fixing. After a single "yes", carry it out in full; before the "yes", don't
create or move anything.

## New section

1. Re-read the section map (`wiki/index.md`): is there already a suitable section or synonym?
2. Propose: path, what goes there, synonyms, template, "External" (yes / ask / no), which pages
   from `notes/` will move there and which links to them will need fixing — as a list.
3. After a "yes": create the folder, add a line to the map, move what was listed and fix the links
   (steps 3–4 of the section below), write a log entry `## [YYYY-MM-DD] restructure | new section …`.
4. Give the section its own `AGENTS.md` only if it really has its own working rules.
   Keep it under 2 000 bytes.

## Moving, renaming, merging, splitting

1. **Plan.** Show the user: what moves where; where the old paths and names are mentioned —
   search all pages and instructions: `[[links]]`, markdown links, the `sources:` field, paths
   in the text of operations and AGENTS.md; which lines of the map and the catalog will change. The log and `_raw/`
   are not rewritten — they are history. The "External" restriction moves together with the material.
2. **Consent.** Don't touch anything without a "yes". Consent already given to this same plan isn't asked again.
3. **Execution:** move the files; fix the links from the list in the plan; update the section map
   and the catalog; if the `personal/` section or a section marked "External: no" was renamed — remind
   the user to update the exclusions in external settings (sync, second model).
4. **Check:** search to make sure no links to the old paths are left.
5. Log: `## [YYYY-MM-DD] restructure | what changed`.

A section is deleted only at a direct request and only when empty. Its pages are moved
first, not deleted.
