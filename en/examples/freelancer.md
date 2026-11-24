---
title: Example — freelancer
type: meta
---

# Example base: freelance designer

> **This is an example, not part of the base.** The agent doesn't use it in answers about the user's affairs.

Who: a freelance designer, 3–5 clients at a time, keeps a portfolio and is learning.
What they want: not to lose revisions and agreements on orders, and to quickly put together portfolio case studies.

## Section map after onboarding

| Section | What goes here | Synonyms | Template | External |
|---|---|---|---|---|
| `wiki/notes/` | Processed material that has no section yet | misc | any | ask |
| `wiki/personal/` | Health, documents, taxes, family | personal, taxes | note.md, document.md | no |
| `wiki/orders/` | A folder per order: brief, revisions, agreements, deadlines | order, project, client | entity.md (kind: project) | ask |
| `wiki/portfolio/` | Finished case studies: task, solution, result | case, works | topic.md | yes |
| `wiki/learning/` | Notes on courses and articles | course, article | learning.md | yes |

## Where things go

- A client's voice message with revisions → the original in `orders/coffee-shop-landing/_raw/`, the revisions as a list
  in `decisions.md` ("Agreed: bigger font, revisions due Friday"), the event in `timeline.md`.
- An order is closed → the agent proposes a case study page in `portfolio/` based on the order folder.
- A tax payment receipt → `personal/`, not shared externally.
