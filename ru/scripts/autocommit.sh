#!/usr/bin/env bash
# Автокоммит базы в git — история изменений и резервная копия.
#
# Забирает в коммит только «остывшие» файлы — те, что не менялись QUIET_MIN минут
# (по умолчанию 30). Так в историю не попадает страница, которую агент или вы
# ещё дописываете. Если у ветки настроен upstream — отправляет туда все
# неотправленные коммиты, в том числе оставшиеся от прошлых неудачных попыток.
#
# Скрипт ничего не скачивает с сервера. Если та же база правится через git
# ещё на одном устройстве — см. docs/синхронизация.md в репозитории шаблона.
#
# Запуск вручную:   ./scripts/autocommit.sh
# Другой порог:     QUIET_MIN=10 ./scripts/autocommit.sh
# По расписанию:    см. docs/синхронизация.md («Автокоммит в git»)
#
# Нужны bash и git 2.25+. Проверено на Linux. На macOS и Windows не проверялось;
# на Windows проще плагин Obsidian Git.

set -euo pipefail

VAULT="${1:-$(cd "$(dirname "$0")/.." && pwd)}"
QUIET_MIN="${QUIET_MIN:-30}"

cd "$VAULT"

fail() { echo "autocommit: $*" >&2; exit 1; }

# 1. Это должен быть корень git-репозитория базы, а не папка внутри чужого репозитория.
top=$(git rev-parse --show-toplevel 2>/dev/null) || fail "папка $VAULT — не git-репозиторий (сделайте git init)"
[ "$(cd "$top" && pwd -P)" = "$(pwd -P)" ] || fail "папка $VAULT лежит внутри другого репозитория ($top) — запустите из корня базы"

# 2. Не вмешиваемся в незавершённое слияние, rebase или cherry-pick.
gitdir=$(git rev-parse --git-dir)
for marker in MERGE_HEAD CHERRY_PICK_HEAD REVERT_HEAD rebase-merge rebase-apply; do
  [ -e "$gitdir/$marker" ] && fail "идёт слияние или rebase ($marker) — завершите его вручную"
done
[ -z "$(git ls-files -u)" ] || fail "есть неразрешённые конфликты — разрешите их вручную"

# 3. Собираем «остывшие» изменения: изменённые, удалённые, новые и уже добавленные в индекс.
now=$(date +%s)
list=$(mktemp)
trap 'rm -f "$list"' EXIT

{ git ls-files -z -m -d -o --exclude-standard; git diff -z --cached --name-only; } |
while IFS= read -r -d '' f; do
  if [ ! -e "./$f" ]; then
    printf '%s\0' "$f"                                          # удалённый — забираем сразу
    continue
  fi
  mtime=$(stat -c %Y "./$f" 2>/dev/null || stat -f %m "./$f")    # Linux || macOS
  if [ $((now - mtime)) -ge $((QUIET_MIN * 60)) ]; then printf '%s\0' "$f"; fi
done | sort -zu >"$list"

# 4. Коммитим ровно эти файлы — даже если в индексе лежит что-то ещё.
if [ -s "$list" ]; then
  git --literal-pathspecs add -A --pathspec-from-file="$list" --pathspec-file-nul
  # Есть ли среди них реальные изменения (git diff не умеет читать список из файла — через xargs).
  if ! xargs -0 git --literal-pathspecs diff --cached --quiet -- <"$list"; then
    count=$(tr -cd '\0' <"$list" | wc -c | tr -d ' ')
    git --literal-pathspecs commit -q --only --pathspec-from-file="$list" --pathspec-file-nul \
      -m "автокоммит: файлов — $count"
  fi
fi

# 5. Отправляем все неотправленные коммиты, если настроен upstream.
if git rev-parse --abbrev-ref --symbolic-full-name '@{u}' >/dev/null 2>&1; then
  if [ "$(git rev-list --count '@{u}..HEAD')" -gt 0 ]; then
    git push -q || fail "не удалось отправить коммиты (нет сети, нет доступа или на сервере есть чужие изменения)"
  fi
fi
