#!/usr/bin/env bash
# Install every herdr plugin listed in plugins.txt that isn't already installed,
# then run the setup steps that plugins need on a fresh machine.
set -euo pipefail

dir="$(cd "$(dirname "$0")" && pwd)"
installed="$(herdr plugin list 2>/dev/null || true)"

while read -r repo <&3; do
  [[ -z "$repo" || "$repo" == \#* ]] && continue
  if grep -q "github:$repo@" <<<"$installed"; then
    echo "herdr: $repo already installed"
  else
    echo "herdr: installing $repo (Rust plugins can take a few minutes on first build)"
    herdr plugin install --yes "$repo"
  fi
done 3< "$dir/plugins.txt"

# agent-usage: writes the Claude Code statusLine, icon font and terminal font map.
# Its config.toml changes are already committed, so this just repairs the
# machine-local parts (it is idempotent).
if grep -q '^levi-qiao/herdr-agent-usage' "$dir/plugins.txt"; then
  herdr plugin action invoke herdr-agent-usage.configure
fi

herdr server reload-config
