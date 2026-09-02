#!/usr/bin/env bash
set -euo pipefail

for cmd in git; do
  command -v "$cmd" >/dev/null 2>&1 || {
    echo "Missing required command: $cmd" >&2
    exit 1
  }
done

BASE_DIR="$(pwd)"
OUT="$BASE_DIR/original-skills"
ZIP="$BASE_DIR/original-skills.zip"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

rm -rf "$OUT" "$ZIP"
mkdir -p "$OUT"

sparse_clone() {
  local repo="$1"
  local dest="$2"
  shift 2
  git clone --depth 1 --filter=blob:none --sparse "$repo" "$dest"
  git -C "$dest" sparse-checkout set "$@"
}

echo "Fetching Matt Pocock skills..."
sparse_clone https://github.com/mattpocock/skills.git "$TMP/matt" \
  skills/engineering/domain-modeling \
  skills/engineering/codebase-design \
  skills/engineering/code-review
cp -a "$TMP/matt/skills/engineering/domain-modeling" "$OUT/domain-modeling"
cp -a "$TMP/matt/skills/engineering/codebase-design" "$OUT/codebase-design"
cp -a "$TMP/matt/skills/engineering/code-review" "$OUT/code-review"

echo "Fetching shadcn skill..."
sparse_clone https://github.com/shadcn-ui/ui.git "$TMP/shadcn" skills/shadcn
cp -a "$TMP/shadcn/skills/shadcn" "$OUT/shadcn"

echo "Fetching Emil design engineering skill..."
sparse_clone https://github.com/emilkowalski/skills.git "$TMP/emil" skills/emil-design-eng
cp -a "$TMP/emil/skills/emil-design-eng" "$OUT/emil-design-eng"

echo "Fetching Cursor thermo-nuclear code quality review skill..."
sparse_clone https://github.com/cursor/plugins.git "$TMP/cursor" cursor-team-kit/skills/thermo-nuclear-code-quality-review
cp -a "$TMP/cursor/cursor-team-kit/skills/thermo-nuclear-code-quality-review" "$OUT/thermo-nuclear-code-quality-review"

cat > "$OUT/FEATURE-ORCHESTRATOR-NOT-VERIFIED.txt" <<'NOTE'
The screenshot labels feature-orchestrator as "my skill - orchestration".
No exact public upstream can be verified from the screenshot alone, so this bundle does not replace it with a similarly named but potentially different skill.
NOTE

if command -v zip >/dev/null 2>&1; then
  (
    cd "$OUT"
    zip -qr "$ZIP" .
  )
else
  echo "ZIP archive skipped: install zip to create $ZIP"
fi

echo
echo "Done."
echo "Folder: $OUT"
if [ -f "$ZIP" ]; then
  echo "ZIP:    $ZIP"
fi
