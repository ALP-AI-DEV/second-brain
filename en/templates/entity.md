---
title: Template — entity folder
type: meta
template_for: entity
---

# Template: entity folder (entity)

An entity is something that lives long and accumulates events: a client, partner, product, project, course,
lawsuit, renovation, trip. The kind of entity is the `kind:` field (client, partner, product, project,
course…). The common kinds have ready-made profiles: `client.md`, `product.md`, `partner.md`.
For the rest — the general profile below. A one-off contact or topic — a single page, no folder.

## Folder

```
<section>/<slug>/
├── AGENTS.md      ← a short instruction, under 1 000 bytes (below)
├── profile.md     ← facts: who it is, people, situation, open questions
├── timeline.md    ← chronology of events
├── decisions.md   ← decisions and promises
├── _raw/          ← originals: transcripts/, emails/, documents/ (don't edit)
└── drafts/        ← our drafts: emails, proposals, agendas
```

The minimal entity is `AGENTS.md` and `profile.md`. Everything else appears as events happen.
The entity gets a line in the `wiki/index.md` catalog (a link to `profile.md`).

## The entity's AGENTS.md

Only how to work and the restrictions, no facts: facts keep growing, and this file is read every time
the folder is accessed. Quotes and excerpts from other people's emails and meetings — only in `_raw/`.

```markdown
# <Name> — how to work with this folder

Before working, read `profile.md`, plus `timeline.md` and `decisions.md` if they exist;
the rules for keeping them — `templates/entity.md`. Don't contradict what is recorded in `decisions.md`.

## Red zones
<what not to promise, what not to bring up — from the user or from meetings and emails>
```

## General profile (`profile.md`)

```markdown
---
title: Name
type: entity
kind: project
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: [project]
---
# Name

## What it is
2–3 sentences: what, why, what state it's in.

## People
| Who | Role | What to know |
|---|---|---|

## Open questions
- [ ] question — whose answer we're waiting for

## Where else the information lives
- tracker, email, cloud folder — links
```

## How to keep `timeline.md`

One line — one event, newest on top. Facts only and a link to the source; conclusions go into the profile.

```
- 2026-11-12 — call with John Miller: agreed on a pilot for 2 departments ([[2026-11-12_pilot]])
```

## How to keep `decisions.md`

Every decision or promise — with a date, who to whom, and a deadline. Sections: "We promised", "The other side
promised", "Agreed", "Declined". This is what saves you at the next meeting.

```
- 2026-11-12 — send a pilot proposal by 2026-11-19. Who: me → John Miller.
  Status: ⏳ / ✅ 2026-11-18 / ❌ cancelled (why)
```

## After a significant session

1. There was an event (meeting, email, call) → a line in `timeline.md`.
2. A promise was made or something was agreed → an entry in `decisions.md`.
3. A question came up → into the profile's "Open questions". Closed → remove it, the outcome goes to the timeline.
4. People or roles changed → the profile; new red zones → the entity's `AGENTS.md`.

A general rule that came out of working with one entity ("lawyers always ask about
personal data") goes on a separate topic page with a link — don't keep it inside the entity.
