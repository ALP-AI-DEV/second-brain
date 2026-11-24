---
title: Template — document
type: meta
template_for: document
---

# Template: document (document)

A contract, certificate, passport, statement, scan. ⚠️ Sensitive data (health, personal
finances, passport, other people's IDs and addresses) — create the page after the user's "yes".

```markdown
---
title: Document name
type: document
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [YYYY-MM-DD_original-name.pdf]
tags: [document, category]
---
# Document name

Original: ![[YYYY-MM-DD_original-name.pdf]]

## What it is
Type of document, who issued it and when.

## Key data
- Number:
- Date:
- Valid until:

## What follows from it
Renewal dates, obligations, what to do.

## Links
- [[related-document]]
```
