# /run-qa skill
When the user runs /run-qa, follow this flow:

1. Determine the suite to run (velvet, bluepaper, or all). Default: all.
2. Get current version from package.json or pyproject.toml
3. Run QA on VPS: `ssh root@72.61.7.236 "/opt/qa/run_qa.sh <suite> <version>"`
4. Parse output for PASS/FAIL results
5. If FAIL: create issue in kanban with failing test details
6. If PASS: report success and confirm qa-approved label
7. Post results summary to channel
