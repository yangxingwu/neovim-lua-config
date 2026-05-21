#!/usr/bin/env bash
# Compare this config against the official LazyVim/starter template.
# Three-way check:
#   1. Files starter has but project doesn't (MISSING)
#   2. Files project has but starter doesn't (EXTRA - informational)
#   3. Files both have with differences (DIVERGED vs EXPECTED)
#
# For files with intentional customizations, we store the expected diff in
# scripts/expected-diffs/. If the actual diff matches the stored one, the
# divergence is expected. If not, either starter changed or we changed
# without updating the expected diff.
#
# Exit 0 if no issues, exit 1 if unexpected divergence found.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
EXPECTED_DIFFS_DIR="$SCRIPT_DIR/expected-diffs"
STARTER_DIR=$(mktemp -d)
trap 'rm -rf "$STARTER_DIR"' EXIT

git clone --depth 1 --quiet https://github.com/LazyVim/starter.git "$STARTER_DIR"

# Files intentionally removed from this project (won't trigger MISSING warning)
ALLOWLIST=(
  "lua/plugins/example.lua"
)

is_allowed() {
  local file="$1"
  for allowed in "${ALLOWLIST[@]}"; do
    if [ "$file" = "$allowed" ]; then
      return 0
    fi
  done
  return 1
}

# Convert file path to expected-diff filename (/ -> -)
diff_filename() {
  echo "$1" | tr '/' '-'
}

# Generate normalized diff (strip header lines with paths/timestamps)
normalized_diff() {
  diff -u "$1" "$2" 2>/dev/null | tail -n +3 || true
}

ISSUES=0

echo "=== Checking starter sync ==="
echo ""

# Collect file lists (excluding .git, LICENSE, README.md)
cd "$STARTER_DIR"
STARTER_FILES=$(find . -type f ! -path './.git/*' ! -name 'LICENSE' ! -name 'README.md' | sed 's|^\./||' | sort)
cd "$PROJECT_DIR"
PROJECT_FILES=$(find . -type f ! -path './.git/*' ! -path './docs/*' ! -path './.claude/*' ! -path './.github/*' ! -path './scripts/*' ! -name 'LICENSE' ! -name 'README.md' ! -name 'CLAUDE.md' ! -name 'GUIDE.md' ! -name 'GUIDE.zh-CN.md' ! -name 'lazy-lock.json' ! -name 'lazyvim.json' | sed 's|^\./||' | sort)

# 1. Files in starter but NOT in project (MISSING)
echo "--- [1/3] Files in starter but not in project ---"
FOUND_MISSING=0
while IFS= read -r file; do
  if [ ! -f "$PROJECT_DIR/$file" ]; then
    if is_allowed "$file"; then
      echo "  SKIPPED (allowlist): $file"
    else
      echo "  MISSING: $file"
      ISSUES=1
      FOUND_MISSING=1
    fi
  fi
done <<< "$STARTER_FILES"
if [ $FOUND_MISSING -eq 0 ]; then
  echo "  (none)"
fi
echo ""

# 2. Files in project but NOT in starter (EXTRA - informational)
echo "--- [2/3] Files in project but not in starter (your customizations) ---"
while IFS= read -r file; do
  if [ ! -f "$STARTER_DIR/$file" ]; then
    echo "  EXTRA: $file"
  fi
done <<< "$PROJECT_FILES"
echo ""

# 3. Files in BOTH - check for differences (DIVERGED vs EXPECTED)
echo "--- [3/3] Files in both - checking for differences ---"
FOUND_DIVERGED=0
while IFS= read -r file; do
  if [ -f "$PROJECT_DIR/$file" ]; then
    if ! diff -q "$STARTER_DIR/$file" "$PROJECT_DIR/$file" > /dev/null 2>&1; then
      # File diverges - check if we have an expected diff
      expected_file="$EXPECTED_DIFFS_DIR/$(diff_filename "$file").diff"
      actual_diff=$(normalized_diff "$STARTER_DIR/$file" "$PROJECT_DIR/$file")

      if [ -f "$expected_file" ]; then
        expected_diff=$(cat "$expected_file")
        if [ "$actual_diff" = "$expected_diff" ]; then
          echo "  EXPECTED: $file (matches stored diff)"
        else
          echo "  CHANGED: $file (diff doesn't match expected!)"
          echo "    Either starter updated this file, or you changed it without"
          echo "    updating scripts/expected-diffs/$(diff_filename "$file").diff"
          echo ""
          echo "  Actual diff:"
          echo "$actual_diff"
          echo ""
          ISSUES=1
          FOUND_DIVERGED=1
        fi
      else
        echo "  DIVERGED: $file (no expected diff stored)"
        echo "$actual_diff"
        echo ""
        ISSUES=1
        FOUND_DIVERGED=1
      fi
    fi
  fi
done <<< "$STARTER_FILES"
if [ $FOUND_DIVERGED -eq 0 ]; then
  echo "  All shared files are in sync (or match expected diffs)."
fi
echo ""

# Summary
echo "=== Summary ==="
if [ $ISSUES -eq 0 ]; then
  echo "All good. Config is in sync with LazyVim/starter."
  exit 0
else
  echo "Issues found. Please review above."
  echo ""
  echo "To update an expected diff after intentional changes:"
  echo "  ./scripts/update-expected-diff.sh <file-path>"
  exit 1
fi
