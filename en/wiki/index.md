---
title: Base catalog
type: index
---
# Base catalog

## Section map

The current sections of the base. The agent checks the map before filing material, and adds a line
only together with a new section, after the user agrees (`operations/restructure.md`).
Entities (clients, projects…) are not listed here — they live in the catalog below.

| Section | What goes here | Synonyms | Template | External |
|---|---|---|---|---|
| `wiki/notes/` | Processed material that has no section yet | misc | any | ask |
| `wiki/personal/` | Health, documents, personal finances, family | personal, health | note.md, document.md | no |

"External" — whether the section's material may be given to the second model and external services: `yes` — allowed;
`ask` — with consent to a particular transfer; `no` — only with explicit permission in "Who I am".
Sensitive material (health, personal finances, documents, family, other people's IDs and addresses) is `no`
in any section. Business prices and budgets aren't sensitive — they stay in their entity.

## Catalog

One line — one knowledge page or entity: `- [[link]] — what it's about, in one line`.
Entity service files (timeline, decisions, `_raw/`, `drafts/`) are not listed here.
