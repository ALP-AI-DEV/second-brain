# Operation: ingest

Synonyms: ingest, process, sort out, process the inbox, "put this in the brain".
No file named — look through `raw/inbox/`, show the list and process the files one by one.
**First process everything that needs no questions, then ask all your questions in one block at the end.**
One doubtful file is no reason to stop the rest.

## What goes in and what doesn't

| What | Decision |
|---|---|
| Notes, ideas, decisions, good documents and case studies, prompts | ✅ Into the base |
| Material you've read, meeting transcripts | ⚙️ Summary into the base, original into raw |
| Bookmarks, services | 🔵 One line in a catalog |
| "Read later" | ⏳ A list of links; after reading — learning notes |
| Tracker tasks, full emails | ❌ A link and a summary, not a copy |
| Anything easy to google | ❌ Leave it out |
| Passwords, keys, tokens | ⛔ Never |

## Steps

1. **Gatekeeper** (see AGENTS.md).
2. **Keep the original** — any unique source:
   - a transcript, email or document about an entity → into its `_raw/` (`transcripts/`, `emails/`,
     `documents/`), named `YYYY-MM-DD_topic.ext`;
   - everything else (PDFs, photos, scans, texts) → into `raw/assets/` with the date in the name;
   - an archive → unpack it into `raw/assets/<archive-name>/` before deleting the archive from the inbox;
   - a web page (🟢/🟡) → a text snapshot in `raw/assets/`, with the URL and capture date in the header.
     A page behind a login or with personal data — only the link;
   - the only thing not stored separately is something moved into a base page in full.
3. **Where to put it** — in this order:
   1. **Sensitivity first** (what counts — "Safety rules" in AGENTS.md): health, personal finances,
      documents, family — into `wiki/personal/` or a map section marked "External: no"; this also
      applies during onboarding and in the background. Business prices and budgets are no reason to
      put a client or project into `personal/`. Unclear whether it's sensitive — ask, and process the rest.
   2. The section map (`wiki/index.md`) and a search of the base: is there a page or entity
      to extend rather than creating a new one?
   3. There's a suitable section — the page goes there. A long story with events (a client, project,
      course) — an entity folder following `templates/entity.md`.
   4. No section — `wiki/notes/`, with `candidate: <the section it calls for>` in the header. A long
      story (a client, a project) — right away as an entity folder inside `notes/`: promises and the
      timeline are kept from day one, and the folder moves into a section during a restructure.
      Don't create a new section during an ingest: propose it (`operations/restructure.md`)
      if there are already 3+ such materials or long-running work is starting.
4. **Essence:** 3 key points. The user's purpose is clear — act and name the place in your report;
   unclear — suggest a place and wait for the answer.
5. **Page** — from a template in `templates/`.
6. **Links:** `[[links]]` and backlinks. One source can touch 5–15 pages —
   update facts, flag contradictions.
7. **Entities:** the source is about an entity — update its `timeline.md`, `decisions.md`, open questions
   in `profile.md` (rules — `templates/entity.md`).
8. `wiki/overview.md` — if the big picture changes.
9. A line in the `wiki/index.md` catalog — for new knowledge pages and entities. A log entry:
   `## [YYYY-MM-DD] ingest | what was processed`.
10. **Delete the source from `raw/inbox/`** — only after checking that the copy is at the path from step 2
    (or its content is fully in the base).
11. **Cross-check by a second model**, if the operation is substantive — `operations/cross-check.md`.

## Special cases

- **Emails, tasks, chats** from connected systems: a summary (who, what was decided, what was promised, deadlines)
  and a link or ID of the original.
- **Images:** determine the type (document, recipe, slide, medical paper); link to the original
  on the page.
- ⚠️ **Sensitive material** (health, personal finances, documents, family) — create the page after a
  "yes", unless the user asked to save exactly this document.

## File conversion

Convert into a temporary folder outside the base and delete it after reading. If the needed tool is missing —
say so and offer to install it, or ask the user to send the file in another format.

| Format | Usual tool |
|---|---|
| MD, TXT, CSV, JSON, HTML | read directly |
| PDF, JPG, PNG | most agents read them natively; if not — `pdftotext`, OCR |
| DOCX, ODT, RTF, EPUB | `pandoc file -t markdown` |
| XLSX | python + openpyxl |
| PPTX | python + python-pptx |
