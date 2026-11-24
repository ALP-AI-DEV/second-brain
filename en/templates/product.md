---
title: Template — product profile
type: meta
template_for: product
---

# Template: product profile (kind: product)

Copied into `<section>/<slug>/profile.md`. The folder and the rules for keeping it — `entity.md`.
Instead of `timeline.md`, a product more often needs `knowledge-base/` (description, prices, answers to frequent
questions) and `agents/` (the product's agent prompts: one file — one agent).

**Source of truth.** If the knowledge base or the prompts live in an external system (a website, the bot's knowledge base,
a CRM), the source is there, and here is a snapshot as of a date: the file header says where and when it was taken. Edits — first
in the source and only at the user's explicit request; don't fix a discrepancy silently — report it.
Implementation specifics for a particular client go into the client's folder with a link to the product.

```markdown
---
title: Product name
type: entity
kind: product
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: [product]
---
# Product name

## What it is and who it's for
2–3 sentences.

## Status
Idea / development / pilots / sales.

## People
Who is responsible for the product, sales, development.

## Source of truth
The external system and a link — or "here".

## Key decisions
- YYYY-MM-DD — what was decided and why

## Open questions
- [ ] ...

## Links
- where the product is being piloted: [[...]]
```
