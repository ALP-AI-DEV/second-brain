# Sync and backup

[← README](../README.en.md) · [Русский](синхронизация.md)

The base is an ordinary folder, so you can sync it with anything. Free options:

| Method | Good for | Keep in mind |
|---|---|---|
| **Syncthing** | Syncing between your own devices without a cloud | Devices need to be online at the same time now and then |
| **Google Drive, Dropbox, iCloud, OneDrive** | The simplest start | No line-by-line history; editing on two devices at once can produce conflicting copies |
| **Obsidian + the Obsidian Git plugin** | Syncing via git across several devices, including Windows | The plugin pulls and pushes changes itself; you need Obsidian on every device |
| **Git + `scripts/autocommit.sh`** | Change history and backup from one computer or server | The script only pushes, it doesn't pull |

The paid [Obsidian Sync](https://obsidian.md/sync) works too, but it isn't required.

**Tip:** however you sync, keep the base in git. It's a free time machine: agents sometimes make
mistakes, and rolling back a bad edit should be easy.

## Autocommit to git

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

Then test the script by hand: `./scripts/autocommit.sh`. It commits new and changed files only once
they haven't changed for 30 minutes, so half-written pages don't end up in the history. Change the
threshold with a variable: `QUIET_MIN=10 ./scripts/autocommit.sh`. Deleted files are committed right
away. Unpushed commits are pushed on the next run.

The script is tested on Linux; it has not been tested on macOS or Windows. To run it every 10
minutes — `crontab -e` and this line (the path is in quotes, errors go to a log):

```bash
*/10 * * * * "$HOME/brain/scripts/autocommit.sh" >> "$HOME/.autocommit-brain.log" 2>&1
```

On Windows the Obsidian Git plugin is simpler: turn on auto-commit, auto-push and auto-pull in it.

## Several devices

If you edit the base via git on several devices, use Obsidian Git (it both pulls and pushes) or
Syncthing / a cloud drive for syncing, and run `autocommit.sh` on one device only, for history.
Otherwise the devices will diverge and pushes will start failing with an error: the script will
report it in the log, but won't resolve the divergence on its own.

## From your phone

Obsidian runs on Android and iOS: you can read the base and drop files into `raw/inbox/` from
anywhere, and the agent will process them in the next session. For that, the base on your phone
must sync by one of the methods above.
