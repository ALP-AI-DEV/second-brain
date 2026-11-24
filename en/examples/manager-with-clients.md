---
title: Example — manager with clients
type: meta
---

# Example base: manager with clients

> **This is an example, not part of the base.** The people, companies and dates are made up. The agent doesn't use this file
> in answers about the user's affairs — only when asked to "show me an example".

Who: the head of a line of business, runs sales and rollout of their product, has clients
and integrator partners. What they want: before any meeting, recall in a minute who's who,
what was promised and what's pending.

## Section map after onboarding

| Section | What goes here | Synonyms | Template | External |
|---|---|---|---|---|
| `wiki/notes/` | Processed material that has no section yet | misc | any | ask |
| `wiki/personal/` | Health, documents, personal finances, family | personal | note.md, document.md | no |
| `wiki/clients/` | A folder for each client in active work | client, customer, deal | client.md | ask |
| `wiki/products/` | A folder per product: description, knowledge base, prompts | product, bot | product.md | yes |
| `wiki/partners/` | A folder per partner | partner, integrator | partner.md | ask |
| `wiki/playbooks/` | How we sell and roll out: scripts, good proposals as examples | sales, procedure | topic.md | yes |

## What a client looks like

```
wiki/clients/daisy/
├── AGENTS.md        ← read profile, timeline, decisions; red zones
├── profile.md       ← a chain of 40 flower shops; people; open questions
├── timeline.md
├── decisions.md
├── _raw/transcripts/2026-11-12_pilot.md
└── drafts/agenda-2026-11-26.md
```

**AGENTS.md → red zones:** don't promise rollout dates for the whole chain before the pilot results;
don't compare us with the previous contractor — they parted on bad terms.

**profile.md (excerpt):**

| Who | Role | What to know |
|---|---|---|
| John Miller | IT director, decision-maker | Decides fast, asks for numbers |
| Anna Brooks | Head of support | Main user; worried the bot will be rude |
| Lawyer (name not given) | Approves the contract | Will ask about personal data |

Open questions: whether customer data can be given to the bot — waiting for the lawyer; for how many requests
the bot can prepare suggestions for the operator — Anna will calculate.

**timeline.md:**
```
- 2026-11-12 — pilot call: John, Anna; agreed on a pilot for 2 departments ([[2026-11-12_pilot]])
- 2026-10-28 — email from Anna: 12 frequent customer questions
- 2026-10-14 — inquiry after the webinar
```

**decisions.md:**
```
## We promised
- 2026-11-12 — send a pilot proposal by 2026-11-19. Who: me → John Miller. Status: ✅ 2026-11-18
- 2026-11-12 — show the bot's answers to 20 frequent questions by 2026-11-26. Status: ⏳
## The other side promised
- 2026-11-12 — John will pass the personal data question to the lawyer.
```

## What this gives you: "prepare me for the meeting with Daisy"

> **Meeting on Nov 26, John and Anna will be there.**
> - We promised to show the bot's answers to 20 frequent questions — by the meeting, status ⏳. The proposal was sent on Nov 18.
> - Waiting from them: the lawyer's answer on personal data (John promised to pass it on), Anna's calculation.
> - Don't promise dates for the whole chain; don't bring up the previous contractor.
> - Propose: start the pilot with one department while the lawyer is thinking.

Not a single question to the user — everything comes from the client's folder.
