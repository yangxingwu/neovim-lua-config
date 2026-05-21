#!/usr/bin/env bash
# Update the expected diff for a file that intentionally diverges from starter.
#
# Usage: ./scripts/update-expected-diff.sh <file-path>
# Example: ./scripts/update-expected-diff.sh lua/config/autocmds.lua

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <file-path>"
  echo "Example: $0 lua/config/autocmds.lua"
  exit 1
fi

FILE="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
EXPECTED_DIFFS_DIR="$SCRIPT_DIR/expected-diffs"
STARTER_DIR=$(mktemp -d)
trap 'rm -rf "$STARTER_DIR"' EXIT

# Clone starter
git clone --depth 1 --quiet https://github.com/LazyVim/starter.git "$STARTER_DIR"

# Check file exists in both
if [ ! -f "$STARTER_DIR/$FILE" ]; then
  echo "Error: $FILE does not exist in starter template."
  exit 1
fi
if [ ! -f "$PROJECT_DIR/$FILE" ]; then
  echo "Error: $FILE does not exist in project."
  exit 1
fi

# Generate and store the normalized diff (strip header with paths/timestamps)
mkdir -p "$EXPECTED_DIFFS_DIR"
DIFF_FILE="$EXPECTED_DIFFS_DIR/$(echo "$FILE" | tr '/' '-').diff"
diff -u "$STARTER_DIR/$FILE" "$PROJECT_DIR/$FILE" | tail -n +3 > "$DIFF_FILE" || true

echo "Updated: $DIFF_FILE"
echo ""
echo "Don't forget to commit:"
echo "  git add $DIFF_FILE"
echo "  git commit -m \"chore: update expected diff for $FILE\""
