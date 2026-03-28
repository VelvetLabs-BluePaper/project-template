# /commit skill
When the user runs /commit, follow this flow:

1. Run `git status` and `git diff --cached` to see staged changes
2. If nothing staged, run `git add -A` (excluding .env and secrets)
3. Analyze changes and generate a concise commit message following conventional commits:
   - `feat:` new feature
   - `fix:` bug fix
   - `docs:` documentation
   - `refactor:` code refactoring
   - `test:` tests
   - `chore:` maintenance
4. Commit with the generated message
5. Show the commit hash and summary
