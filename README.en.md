# A second brain for your AI agent

[Русская версия](README.md)

A template for a personal knowledge base maintained by an AI agent. It's an ordinary folder of
markdown files: you drop in meetings, emails, documents and thoughts, and the agent files them,
links them together and finds what you need. The kit contains rules for the agent, procedures and
page templates; there are no integrations with email, messengers or trackers — you connect those
to your agent yourself.

It works with any agent that can read and write files: Claude Code, Codex, Cursor, Gemini CLI and
others. It's based on Andrej Karpathy's [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
approach: the AI doesn't search raw documents, it "compiles" them into a connected wiki.

## Why

- **Stop re-explaining context** to the agent for every task: who the client is, what was decided, what was promised.
- **Stop losing work in old chats** that you can't find a week later.
- **Stop depending on context compaction**, which drops unpredictable parts of a long conversation.

One principle: **knowledge lives in files, not in the chat.** Every new conversation starts with the
agent reading the base, so preparing for a meeting or asking "who promised what" takes one request.

---

## What you need

- **An AI agent with file access:** it opens a folder on your computer or server and edits files there.
  A regular browser chat isn't enough. For daily work you'll usually need a paid plan.
- **Basic agent skills:** open a folder, write a task, read the answer.
- **Optional:** [Obsidian](https://obsidian.md) — handy for reading the base, viewing the link
  graph and working from your phone.

You can use the base without an agent, but it's much less useful: the agent is what sorts, links
and tidies it. Keeping it by hand is slow.

---

## Quick start

1. **Download the template:** the green **Code → Download ZIP** button, then unpack the archive.
2. **Copy the `en/` folder** to where the base will live and rename it — for example, to `brain`.
   Copy the whole folder, including hidden files (`.gitignore`). The Russian version is in `ru/`.
3. **Open this folder in your agent**, like any project. In Obsidian — Open folder as vault: this
   folder must be the root, otherwise links between pages won't resolve.
4. **Say "Let's get to know each other."** The agent will ask three questions: what you do and what
   you want to remember more easily, which material to process first, what must not be shared
   externally. Then it processes that material and, if the default folders aren't enough, proposes
   sections for you. At the end it offers a choice: get to work right away, or "Let's set up the base
   in depth" — 10–20 minutes of questions, after which sections and rules fit the way you work.
   Or skip onboarding: drop a file into `raw/inbox/` and say "process the inbox".

To check that the agent has read the rules, ask "How is this base organized and what can you do?" —
it should tell you about the inbox, the section map and operations.

The base starts empty: the agent builds the structure around you. What it can look like after a
couple of weeks — see the [examples](en/examples/): [manager with clients](en/examples/manager-with-clients.md),
[freelancer](en/examples/freelancer.md), [personal only](en/examples/personal-only.md).

---

## First commands

| What to tell the agent | What happens |
|---|---|
| "Here's the transcript of the meeting with John, put it in the brain" | A meeting summary; promises go to the client's `decisions.md`, the event to `timeline.md` |
| "Prepare me for the meeting with …" | Who's who, what's open, what we promised and what the other side promised |
| "What did I promise and not do?" | All unfinished promises; overdue ones listed separately |
| "What do we know about …?" | An answer from the base with links to pages |
| "Process the inbox" | The agent assesses each file in `raw/inbox/` and files it |
| "Check the base" | A report: contradictions, broken links, duplicates, forgotten questions |
| "Let's set up the base in depth" (or "grill me") | Questions in rounds, with recommendations for decisions about the base; the result is a plan for sections and rules that the agent carries out once you agree |

There's also "reflect" (how to improve the schema itself) and "create a section for …" — the full
list of operations is in `AGENTS.md`.

---

## How it works

```
brain/
├── AGENTS.md            ← rules for the agent (CLAUDE.md and GEMINI.md point to it)
├── operations/          ← procedures: onboarding, inbox processing, checks, reflection…
├── templates/           ← page and profile templates (client, product, partner, any entity)
├── examples/            ← what a base can look like; not part of the base
├── scripts/             ← git autocommit
├── raw/inbox/           ← drop everything here without thinking
├── raw/assets/          ← originals: PDFs, photos, scans
└── wiki/
    ├── index.md         ← section map and page catalog
    ├── notes/           ← processed material that has no section yet
    ├── personal/        ← health, documents, personal finances
    └── …                ← sections the agent creates for you
```

- **Raw material apart from knowledge.** Originals live in `raw/` and in `_raw/` folders and are
  never edited. `wiki/` holds the distilled part: decisions, promises, questions, deadlines, links.
- **Gatekeeper.** The agent first rates new material: 🟢 into the base, 🟡 condense, 🔵 one line in
  a catalog, 🔴 don't keep.
- **Structure built around you.** Sections grow out of your material and are recorded in the map at
  the top of `index.md`, so every session puts things on the same shelves. The agent moves
  sections only by an agreed plan.
- **A folder per entity.** A client, project, course or case gets a folder: profile, history
  (`timeline.md`) and a log of decisions and promises (`decisions.md`). The agent checks the log
  and tells you when something new conflicts with what's already decided.
- **Cross-check by a second model.** After substantial operations another model reviews the result,
  ideally from another vendor: a model is bad at seeing its own mistakes. Until a second model is set
  up, the agent shows the result marked "not cross-checked" and offers to connect one; you can also
  do it by hand — the agent prepares a task you can paste into another model's chat.

---

## Keeping the base current

The agent only knows what's in the base. If something was decided on a call or in a thread without
it, hand it the transcript, the email or a couple of lines — otherwise it will show you an outdated
agreement. The more of your work goes through the agent opened in the base, the fewer gaps.

The agent doesn't run checks and reflection on a schedule by itself — ask for them: for example, a
check once a week and reflection every couple of dozen inbox runs.

---

## Sync and backup

The base is an ordinary folder: Syncthing, a cloud drive, Obsidian Sync or git all work. However
you sync, **keep the base in git** — agents sometimes make mistakes, and rolling back a bad edit
should be easy. The template includes an autocommit script; it pushes changes but doesn't pull.
Comparison of methods and setup — in [docs/sync.md](docs/sync.md).

From your phone: Obsidian for Android and iOS lets you read the base and drop files into
`raw/inbox/` — with sync set up, the agent will process them in the next session.

---

## FAQ

**How does each agent read the rules?**
Codex and Cursor read `AGENTS.md` on their own. For Claude Code the template has `CLAUDE.md`, and
for Gemini CLI — `GEMINI.md`: both import `AGENTS.md`. Tell any other agent to read `AGENTS.md` at
the start. Not every agent picks up nested `AGENTS.md` files in folders, so the rules tell the
agent to read them explicitly.

**How private is it?**
Unless you run a local model, the agent is a cloud model: everything it reads goes to its
provider. The "External: no" mark in the section map and the `personal/` folder are rules for the agent: it won't pass
that material to a second model or services without permission. That's not technical protection
of the files. If a document must not be shown even to your agent, don't put it in the base.

**Can I store passwords and keys?**
No. The base gets synced and ends up in the cloud. Keep secrets in a password manager; the
template's `.gitignore` is only a safety net.

**Personal and work in one base?**
Fine for a personal brain — they're together in your head too. If the base is shared with a team,
keep personal things separate.

**Is Obsidian required?**
No. It's a handy viewer with a link graph and a mobile app; the agent doesn't need it.

**How do I update the template once the base is in use?**
Don't copy the new version over it: you'll overwrite "Who I am", your own rules and the contents of
`wiki/`. Download the new version into a separate folder and ask the agent: "compare `AGENTS.md`,
`operations/` and `templates/` with the version in folder … and suggest what to bring over". It
should keep your data and edits.

**Found a bug or have an idea?**
Open an [issue](https://github.com/ALP-AI-DEV/second-brain/issues): which agent and version, what
you asked for, what you expected and what you got. Keep examples anonymized.

---

## License

[MIT](LICENSE) © 2026 ALP AI DEV
