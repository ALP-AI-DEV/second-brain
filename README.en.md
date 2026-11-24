# A second brain for your AI agent

[Русская версия](README.md)

A template for a personal knowledge base maintained by an AI agent. It's an ordinary folder of markdown files:
you drop meetings, emails, documents and thoughts into it, and the agent sorts them,
links them together and finds what you need in minutes.

It works with any agent that can read and write files: Claude Code, Codex, Cursor,
Gemini CLI and others.

---

## Why

If you work with AI agents seriously, you know these pains:

- **You become a typist.** For every new task you explain the context to the agent
  all over again: who the client is, what was decided, what was promised.
- **Chats go stale.** You did a big piece of work with the agent, closed the window, and a week later a small
  question on the same topic came up. You can't find the old chat, explaining everything again takes ages, and important details get lost.
- **Context compression is unpredictable.** In a long conversation the agent "forgets" part of the history, and
  you can't guess in advance what exactly it will drop.

A second brain solves this with one principle: **knowledge lives in files, not in the chat.** Every new
conversation starts with the agent reading the base. Preparing for a client meeting, remembering
who promised what, finding where a task got stuck — one question and a couple of minutes.

And once every client, product and project has its own folder with history and decisions, you can
let agents work on their own: each one sits in its folder and knows everything you know.
**A second brain is the first step toward autonomous agents.**

It's based on the [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) approach
described by Andrej Karpathy: the AI doesn't just search raw documents, it "compiles" them
into a connected wiki.

---

## What you need

- **An AI agent with file access:** Claude Code, Codex (CLI or app), Cursor, Gemini CLI —
  any agent that opens a folder on your computer or server. A regular chat in the browser won't do.
  Not all of them have free plans, and free plans hit limits quickly; for daily work, plan
  on a subscription from ~$20 a month.
- **Basic agent skills:** open a folder, write a task, read the answer.
- **Optional:** [Obsidian](https://obsidian.md) (free) — handy for reading the base yourself,
  viewing the link graph and working from your phone.

The base itself costs nothing: it's just files.

---

## Setup

1. **Download the template.** On the repository page: the green **Code → Download ZIP** button.
   Unpack the archive.
2. **Copy the `en/` folder** to where the base will live and rename it as you like — for example,
   `brain`. Copy the whole folder, including hidden files (`.gitignore`).
3. **Open this folder in your agent** — the same way you open any project. If you use
   Obsidian, open the same folder as a vault (Open folder as vault): this folder must be the root,
   otherwise links between pages won't resolve.
4. **Tell the agent: "Let's get to know each other."** It will ask three questions: what you do and what
   you want to remember more easily, which material to process first, what must not be shared externally. Then
   it will process that material and propose 2–5 sections for you — only the ones you need.
   You can also skip onboarding: just drop a file into `raw/inbox/` and say "process the inbox".

The base starts empty — the agent builds the structure around you instead of imposing someone else's. What it can
look like is shown in the `examples/` folder: a manager with clients, a freelancer, personal only.
Tell the agent "show me with an example how you prepare me for a meeting" — it will show you on a made-up client.

To check that the agent has read the schema, ask "How is this base organized and what can you do?" —
it should tell you about the inbox, the section map and operations.

---

## First commands

| What to tell the agent | What happens |
|---|---|
| "Process the inbox" | The agent takes the files from `raw/inbox/`, assesses each one, suggests a place and files it |
| "Here's the transcript of the meeting with John, put it in the brain" | A meeting summary, promises go to `decisions.md`, the event to `timeline.md` |
| "Prepare me for the meeting with …" | Who's who, what's open, what we promised and what the other side promised |
| "What did I promise and not deliver?" | A list of overdue promises across all folders |
| "Create a section for …" | The agent proposes a section, shows what will move there, and creates it after a "yes" |
| "What do we know about …?" | An answer from the base with links to pages |
| "Check the base" | A report: contradictions, broken links, duplicates, forgotten questions |
| "Reflect" | What has grown too big, what to merge, how to improve the schema itself |

---

## How it works

```
brain/
├── AGENTS.md            ← the schema: rules for the agent
├── CLAUDE.md, GEMINI.md ← one line each: point Claude Code and Gemini CLI to AGENTS.md
├── operations/          ← procedures: onboarding, ingest, lint, reflect…
├── templates/           ← page and profile templates (client, product, partner, any entity)
├── examples/            ← what a base can look like; not part of the base
├── scripts/             ← git autocommit
├── raw/
│   ├── inbox/           ← drop everything here without thinking
│   └── assets/          ← originals: PDFs, photos, scans
└── wiki/
    ├── index.md         ← section map and page catalog
    ├── log.md           ← operations log
    ├── overview.md      ← the big picture
    ├── notes/           ← processed material that has no section yet
    ├── personal/        ← health, documents, finances — not shared externally
    └── …                ← sections the agent will create for you
```

**Key ideas of the schema:**

- **Raw material separate from knowledge.** Originals live in `raw/` and in `_raw/` folders and are never changed.
  `wiki/` holds the distilled version: decisions, promises, questions, deadlines, links.
- **Gatekeeper.** Before adding new material, the agent gives an honest assessment: 🟢 definitely in,
  🟡 condense and keep, 🔵 one line in a catalog, 🔴 leave out. Junk doesn't get into the base.
- **Structure built around you.** Sections come from your materials, not in advance. Each one is recorded
  in the section map at the top of `index.md` — so in any session the agent puts things on the same
  shelves instead of inventing new ones. The agent can move or rename a section only
  by an agreed plan, fixing all the links.
- **A folder per entity.** Anything that lives long — a client, project, course, case — gets a folder:
  a profile, a chronology (`timeline.md`) and a log of decisions and promises (`decisions.md`). The agent
  doesn't contradict what has already been promised.
- **Safety rules.** Secrets don't go into the base, personal and sensitive material isn't given to the second
  model without permission, and the agent changes nothing in external systems without your request.
  Rules in nested folders refine how to work, but don't override these prohibitions.
- **A short schema.** `AGENTS.md` contains only what's needed in every session. Detailed procedures
  live in `operations/`, and the agent reads them when it starts an operation. This matters: some agents
  read a limited amount of instructions and silently cut off the rest.
- **Cross-check by a second model.** After substantive operations, another model checks the result,
  ideally from another vendor: a model is bad at spotting its own mistakes, while another one often catches them on the first
  pass. You specify in `AGENTS.md` which model to call and what it may see. If there's no second
  model, the agent will prepare a task for you to paste into another model's chat.
- **Regular hygiene.** Once a week — a lint: contradictions, broken links, sections
  missing from the map, old drafts. Every ~20 ingests — a reflection: is it time to split or
  merge sections, what to improve in the schema itself. The schema grows with the base, but doesn't bloat.

---

## Sync and backup

The base is an ordinary folder, so you can sync it with anything. Free options:

| Method | Good for | Keep in mind |
|---|---|---|
| **Syncthing** | Syncing between your own devices without a cloud | Devices need to be online at the same time now and then |
| **Google Drive, Dropbox, iCloud, OneDrive** | The simplest start | No line-by-line history; editing on two devices at once can produce conflicting copies |
| **Obsidian + the Obsidian Git plugin** | Syncing via git across several devices, including Windows | The plugin pulls and pushes changes itself; you need Obsidian on every device |
| **Git + `scripts/autocommit.sh`** | Change history and backup from one computer or server | The script only pushes, it doesn't pull |

The paid [Obsidian Sync](https://obsidian.md/sync) works too, but it isn't required.

**Tip:** however you sync, keep the base in git. It's a free time machine:
agents sometimes make mistakes, and rolling back a bad edit should be easy.

### Autocommit to git

Set up git once and check that pushing works (you need git 2.28 or newer):

```bash
cd ~/brain                                  # your base folder
git config --global user.name  "Your Name"  # if git isn't set up yet
git config --global user.email "you@example.com"
git init -b main
git add -A && git commit -m "first commit"
# optionally — a private repository on GitHub or GitLab:
git remote add origin <repository-url>
git push -u origin main                     # should succeed without errors
```

Then test the script by hand: `./scripts/autocommit.sh`. It commits only files
that haven't changed for 30 minutes, so half-written pages don't end up in the history. Unpushed
commits are pushed on the next run.

The script is tested on Linux; it has not been tested on macOS or Windows. To run it every 10 minutes — `crontab -e` and this line (the path is in quotes, errors
go to a log):

```bash
*/10 * * * * "$HOME/brain/scripts/autocommit.sh" >> "$HOME/.autocommit-brain.log" 2>&1
```

On Windows the Obsidian Git plugin is simpler: turn on auto-commit, auto-push and auto-pull in it.

**If you edit the base via git on several devices** — use Obsidian Git (it both
pulls and pushes) or Syncthing / a cloud drive for syncing, and run `autocommit.sh`
on one device only, for history. Otherwise the devices will diverge and pushes will start failing
with an error: the script will report it in the log, but won't resolve the divergence on its own.

---

## The main rule — discipline

A second brain works exactly as well as you keep it filled. Once you start doing things
outside the base, gaps appear, and the agent will show you an outdated agreement or a wrong date.

So move your work to the agent completely. An email, a call, a transcript, a contract —
do it all through the agent opened in the brain. Then context doesn't get scattered across chats, and the base
gets updated as you work.

---

## From your phone

- **Obsidian** is available on Android and iOS: you can read the base and drop files into `raw/inbox/` from
  anywhere, and the agent will process them in the next session.
- If your agent runs on a server and is connected to a messenger (for example, via a Telegram bot),
  you can just send it a photo, a voice message or a document — it will file it into the existing
  sections, and propose a new section when you come back to it.

---

## What's next: from a brain to agents

Once every client and project has its own folder with the full history, the next step suggests
itself. You can put a separate agent in a client's folder: it knows the profile, the chronology and all
the promises, processes new emails and meetings itself, and comes to you only for decisions. On top of such
agents you can build a whole digital department where each one has its own role and permissions. But the foundation
is the same — a second brain.

---

## Who it's not for

- People who know neural networks only from the news or chat with them in an app. This needs
  an agent that works with files, not a chat.
- Without an AI agent the base is useless: everything assumes the agent keeps it in order.

---

## FAQ

**How does each agent read the schema?**
Codex and Cursor read `AGENTS.md` on their own. Claude Code since version 2.1.277 also reads `AGENTS.md`
if there's no `CLAUDE.md` in the folder; for older versions the template includes a one-line `CLAUDE.md`
with `@AGENTS.md`. Gemini CLI reads `GEMINI.md` by default — the template has one, and it also pulls in
`AGENTS.md`. For any other agent, tell it to read `AGENTS.md` at the start of work.
Not all agents pick up the nested `AGENTS.md` files in section and entity folders, so the schema
tells the agent to read them explicitly.

**Is Obsidian required?**
No. It's a handy "viewer" with a link graph and a mobile app, but the agent doesn't need it.

**Personal and work in one base?**
They're together in your head too, so for a personal brain that's fine. If the base is shared with a team
or a company, keep personal matters separate.

**Can I store passwords and keys?**
No. The base is synced and ends up in the cloud. Keep secrets in a password manager.
The `.gitignore` in the template is just a safety net: it won't stop a password typed into an ordinary note.

**What does the base share with the second model?**
Only what you allow in `AGENTS.md` ("Who I am" → "What may be shared externally"). The
`personal/` folder and sections marked "External: no" in the map are not shared without permission. If it isn't specified,
the agent will ask before sending sensitive documents.

**The schema is in English, but I want it in Russian.**
Take the [`ru/`](ru/) folder — the same base in Russian.

---

## License

[MIT](LICENSE) © 2026 ALP AI DEV
