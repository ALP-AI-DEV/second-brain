---
title: Template — client profile
type: meta
template_for: client
---

# Template: client profile (kind: client)

Copied into `<section>/<slug>/profile.md`. The folder and the rules for keeping it — `entity.md`.
Don't delete an empty section — keep the heading and "—": all clients have the same structure.

```markdown
---
title: Client name
type: entity
kind: client
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: [client]
---
# Client name

## Who they are
What they do, size, where they came from.

## People
| Who | Role | What to know |
|---|---|---|
| ... | decision-maker / user / lawyer | ... |

## What we do for the client
- ...

## Open questions
- [ ] question — who should answer

## Where else the information lives
- Task tracker: link
- Email: subject or thread ID
- Documents folder: link
```

The client's red zones (what not to promise, what not to bring up) — in the folder's `AGENTS.md`.
