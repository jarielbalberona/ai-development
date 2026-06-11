#!/usr/bin/env bash
set -euo pipefail

root="${1:-$(pwd)}"
projects_dir="$root/projects"

warn=0

if [ ! -d "$projects_dir" ]; then
  echo "Markdown hygiene check: no projects directory found at $projects_dir"
  exit 0
fi

for project_dir in "$projects_dir"/*; do
  [ -d "$project_dir" ] || continue

  for name in \
    docs \
    docs.legacy-review \
    .ai \
    .agent \
    .codex \
    initiatives \
    reports \
    archive \
    task-notes \
    plans
  do
    if [ -d "$project_dir/$name" ]; then
      printf 'WARN: forbidden project folder found: %s\n' "$project_dir/$name"
      warn=1
    fi
  done
done

if [ "$warn" -eq 0 ]; then
  echo "Markdown hygiene check: no forbidden project markdown/task folders found."
fi
