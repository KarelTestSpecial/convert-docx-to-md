#!/usr/bin/env bash
# Bulk-conversie van .docx naar Markdown met pandoc.

set -euo pipefail

SRC_DIR="${1:-.}"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "❌ pandoc ontbreekt — zie https://pandoc.org/installing.html" >&2
  exit 1
fi

OUT_DIR="${SRC_DIR}/md_output"
mkdir -p "$OUT_DIR"

converted=0
for file in "$SRC_DIR"/*.docx; do
  [ -f "$file" ] || continue
  base="$(basename "${file%.docx}")"
  pandoc "$file" -f docx -t markdown -o "${OUT_DIR}/${base}.md"
  echo "✅ Converted: $(basename "$file") → md_output/${base}.md"
  converted=$((converted + 1))
done

if [ "$converted" -eq 0 ]; then
  echo "ℹ️  Geen .docx-bestanden gevonden in ${SRC_DIR}"
else
  echo "✅ ${converted} bestand(en) geconverteerd naar ${OUT_DIR}"
fi
