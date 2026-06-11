#!/usr/bin/env sh
set -eu

usage() {
  cat <<'EOF'
Usage: .ai/scripts/init-project.sh [--force] <domain-name>

Creates projects/<domain-name>/ from .ai/templates/project/.
Generates .ai-local/core-snapshot.md.
Prints a reminder to update .ai/workspace/project-index.local.md when using a local/private routing file, or to use .ai/workspace/project-index.example.md as the committed format reference.
EOF
}

force=0
if [ "${1:-}" = "--force" ]; then
  force=1
  shift
fi

domain="${1:-}"
if [ -z "$domain" ]; then
  usage
  exit 1
fi

root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
project_dir="$root/projects/$domain"
template_dir="$root/.ai/templates/project"

if [ -e "$project_dir" ] && [ "$force" -ne 1 ]; then
  printf '%s\n' "Refusing to overwrite existing project: $project_dir" >&2
  exit 1
fi

mkdir -p "$project_dir"
cp -R "$template_dir"/. "$project_dir"/

if [ -f "$project_dir/.ai-project.md" ]; then
  tmp="$project_dir/.ai-project.md.tmp"
  sed "s/<domain-name>/$domain/g" "$project_dir/.ai-project.md" > "$tmp"
  mv "$tmp" "$project_dir/.ai-project.md"
fi

"$root/.ai/scripts/sync-project-ai.sh" "$domain"

printf '%s\n' "Reminder: update $root/.ai/workspace/project-index.local.md with an entry for $domain when using a local/private routing file."
printf '%s\n' "Committed template: $root/.ai/workspace/project-index.example.md"
