---
title: Example — personal only
type: meta
---

# Example base: personal only

> **This is an example, not part of the base.** The agent doesn't use it in answers about the user's affairs.

Who: someone who keeps only their own life in the base. What they want: not to hunt for test results and documents
in email and photos, to remember what the doctor advised, to collect recipes and trip plans.

## Section map after onboarding

| Section | What goes here | Synonyms | Template | External |
|---|---|---|---|---|
| `wiki/notes/` | Processed material that has no section yet | misc | any | ask |
| `wiki/personal/` | Documents, finances, family | documents, finances | document.md | no |
| `wiki/personal/health/` | Test results, doctors' prescriptions, medications | health, doctor, tests | document.md, note.md | no |
| `wiki/recipes/` | Recipes that turned out well | recipe, cooking | note.md | yes |
| `wiki/trips/` | A folder per trip: route, bookings, what to take | trip, vacation | entity.md (kind: trip) | ask |
| `wiki/books/` | Notes on what I've read | book, article | learning.md | yes |

## Where things go

- A photo of a blood test → the original in `raw/assets/`, a page in `personal/health/` with the values
  and a link to the original; the agent warns that this is medical data.
- "The doctor said to take vitamin D for two months" → a line on the prescriptions page with the date and duration.
- A link to a recipe → a text snapshot in `raw/assets/`, a page in `recipes/`.
