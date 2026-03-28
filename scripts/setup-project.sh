#!/bin/bash
# Usage: ./scripts/setup-project.sh "My Project" "my-repo" "Next.js + TypeScript"
set -euo pipefail

PROJECT_NAME="${1:?Usage: $0 <project-name> <repo-name> <stack>}"
REPO_NAME="${2:?Usage: $0 <project-name> <repo-name> <stack>}"
STACK="${3:?Usage: $0 <project-name> <repo-name> <stack>}"

echo "Setting up project: $PROJECT_NAME ($REPO_NAME) with stack: $STACK"

# Find and replace placeholders in all files
find . -type f -not -path './.git/*' -not -path './node_modules/*' | while read -r file; do
  if file "$file" | grep -q text; then
    sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$file"
    sed -i "s/{{REPO_NAME}}/$REPO_NAME/g" "$file"
    sed -i "s/{{STACK}}/$STACK/g" "$file"
  fi
done

echo "Done. Placeholders replaced:"
echo "  {{PROJECT_NAME}} → $PROJECT_NAME"
echo "  {{REPO_NAME}}    → $REPO_NAME"
echo "  {{STACK}}         → $STACK"
echo ""
echo "Next steps:"
echo "  1. Review CLAUDE.md and adjust for your project"
echo "  2. Update .env with your credentials"
echo "  3. git add -A && git commit -m 'chore: initialize $PROJECT_NAME'"
