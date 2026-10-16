---
name: code-review
description: Review uncommitted changes or a branch diff for bugs, risky patterns, and missing tests. Use when asked to review, check, or sanity-check changes before committing.
---

# Code review

1. Get the diff only — never read whole files up front:
   - Uncommitted: `git diff --stat` then `git diff`
   - Branch: `git diff main...HEAD --stat` then the diff
2. If the diff is large (>500 lines), review file by file using `git diff -- <path>`.
3. Open surrounding code only where a change can't be judged from the diff alone, and read just that range.

Check for, in priority order:
- Bugs: wrong logic, off-by-one, null/undefined handling, unhandled errors
- Security: secrets in code, unsanitized input, injection risks
- Missing or broken tests for changed behavior
- Anything that contradicts the project's CLAUDE.md conventions

Skip style nitpicks unless they hide a bug.

Output:
- **Verdict:** ship / fix first
- **Issues:** `path:line` — problem — suggested fix (most severe first, max 10)
- Nothing else. No summary of what the code does.
