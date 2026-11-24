---
title: Page type registry
type: meta
---

# Page type registry

The `type:` field in the header of every page is one of the values below. A new type is added only
by editing this file. A new **entity kind** (course, case, trip) is not a new type but a new `kind:` value
of `entity`; it's enough to describe it in the section map or create a profile template.

| type | What it is | Template |
|---|---|---|
| `topic` | Topic: idea, method, concept | `topic.md` |
| `insight` | Answer to a question, analysis | `insight.md` |
| `catalog` | Registry of similar entries | `catalog.md` |
| `prompt` | Reusable prompt | `prompt.md` |
| `document` | Document, scan | `document.md` |
| `learning` | Notes on something read | `learning.md` |
| `note` | Simple note, recipe | `note.md` |
| `entity` | Entity profile (`profile.md`), kind — in `kind:` | `entity.md`, `client.md`, `product.md`, `partner.md` |
| `timeline` | Entity chronology | `entity.md` |
| `decisions` | Decisions and promises | `entity.md` |
| `transcript` | Meeting transcript (`_raw/transcripts/`) | — |
| `email-summary` | Summary of correspondence (`_raw/emails/`) | — |
| `draft` | Working draft (`drafts/`) | — |
| `index` | Catalog, log, overview | — |
| `meta` | Instructions and templates (`AGENTS.md`, `templates/`) | — |

Common `kind:` values — `client`, `partner`, `product`, `project`, `course`, `case`. Your own — one word,
in English or in your base language, but consistent across the whole base.
