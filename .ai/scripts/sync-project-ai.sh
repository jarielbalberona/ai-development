#!/usr/bin/env sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)

snapshot_for() {
  project="$1"
  project_dir="$root/projects/$project"
  snapshot="$project_dir/.ai-local/core-snapshot.md"

  mkdir -p "$project_dir/.ai-local"

  {
    printf '%s\n' "# Generated Core Snapshot"
    printf '%s\n' ""
    printf '%s\n' "Generated from parent .ai/core/*.md."
    printf '%s\n' "Fallback only. Do not edit by hand."
    printf '%s\n' ""
    for file in "$root"/.ai/core/*.md; do
      [ -f "$file" ] || continue
      printf '%s\n' "---"
      printf '%s\n' "Source: ${file#$root/}"
      printf '%s\n' "---"
      cat "$file"
      printf '%s\n' ""
    done
  } > "$snapshot"
}

if [ "${1:-}" = "--all" ] || [ $# -eq 0 ]; then
  for dir in "$root"/projects/*; do
    [ -d "$dir" ] || continue
    snapshot_for "$(basename "$dir")"
  done
else
  for project in "$@"; do
    snapshot_for "$project"
  done
fi

