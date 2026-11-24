#!/usr/bin/env bash
# Autocommit of the base to git — change history and backup.
#
# Commits only "settled" files — those not modified for QUIET_MIN minutes
# (30 by default). This keeps out of the history a page that the agent or you
# are still writing. If the branch has an upstream, pushes all unpushed
# commits there, including those left over from earlier failed attempts.
#
# The script never pulls from the server. If the same base is also edited via git
# on another device — see docs/sync.md in the template repository.
#
# Manual run:       ./scripts/autocommit.sh
# Other threshold:  QUIET_MIN=10 ./scripts/autocommit.sh
# On a schedule:    see docs/sync.md ("Autocommit to git")
#
# Requires bash and git 2.25+. Tested on Linux. Not tested on macOS or Windows;
# on Windows the Obsidian Git plugin is simpler.

set -euo pipefail

VAULT="${1:-$(cd "$(dirname "$0")/.." && pwd)}"
QUIET_MIN="${QUIET_MIN:-30}"

cd "$VAULT"

fail() { echo "autocommit: $*" >&2; exit 1; }

# 1. This must be the root of the base's git repository, not a folder inside someone else's repository.
top=$(git rev-parse --show-toplevel 2>/dev/null) || fail "folder $VAULT is not a git repository (run git init)"
[ "$(cd "$top" && pwd -P)" = "$(pwd -P)" ] || fail "folder $VAULT is inside another repository ($top) — run it from the base root"

# 2. Don't interfere with an unfinished merge, rebase or cherry-pick.
gitdir=$(git rev-parse --git-dir)
for marker in MERGE_HEAD CHERRY_PICK_HEAD REVERT_HEAD rebase-merge rebase-apply; do
  [ -e "$gitdir/$marker" ] && fail "a merge or rebase is in progress ($marker) — finish it manually"
done
[ -z "$(git ls-files -u)" ] || fail "there are unresolved conflicts — resolve them manually"

# 3. Collect "settled" changes: modified, deleted, new and already staged.
now=$(date +%s)
list=$(mktemp)
trap 'rm -f "$list"' EXIT

{ git ls-files -z -m -d -o --exclude-standard; git diff -z --cached --name-only; } |
while IFS= read -r -d '' f; do
  if [ ! -e "./$f" ]; then
    printf '%s\0' "$f"                                          # deleted — take it right away
    continue
  fi
  mtime=$(stat -c %Y "./$f" 2>/dev/null || stat -f %m "./$f")    # Linux || macOS
  if [ $((now - mtime)) -ge $((QUIET_MIN * 60)) ]; then printf '%s\0' "$f"; fi
done | sort -zu >"$list"

# 4. Commit exactly these files — even if something else is staged.
if [ -s "$list" ]; then
  git --literal-pathspecs add -A --pathspec-from-file="$list" --pathspec-file-nul
  # Are there real changes among them (git diff can't read the list from a file — hence xargs).
  if ! xargs -0 git --literal-pathspecs diff --cached --quiet -- <"$list"; then
    count=$(tr -cd '\0' <"$list" | wc -c | tr -d ' ')
    git --literal-pathspecs commit -q --only --pathspec-from-file="$list" --pathspec-file-nul \
      -m "autocommit: $count files"
  fi
fi

# 5. Push all unpushed commits if an upstream is set.
if git rev-parse --abbrev-ref --symbolic-full-name '@{u}' >/dev/null 2>&1; then
  if [ "$(git rev-list --count '@{u}..HEAD')" -gt 0 ]; then
    git push -q || fail "could not push commits (no network, no access, or the server has changes from elsewhere)"
  fi
fi
