#!/usr/bin/env bash
# Renders all .mmd files in `diagrams/mermaid` to `diagrams/svg` using mermaid-cli
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="${ROOT_DIR}/diagrams/mermaid"
OUT_DIR="${ROOT_DIR}/diagrams/svg"
mkdir -p "${OUT_DIR}"

for f in "${SRC_DIR}"/*.mmd; do
  [ -e "$f" ] || continue
  name="$(basename "$f" .mmd)"
  npx -y @mermaid-js/mermaid-cli -i "$f" -o "${OUT_DIR}/${name}.svg" || echo "Failed to render $f"
done
