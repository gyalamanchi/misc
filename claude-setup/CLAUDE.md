# Global rules (applies to every project)

## Token discipline
- Read only what the task needs. Use grep/glob to locate code before opening files; read line ranges, not whole files, when they are large.
- Don't re-read files you just edited. Don't echo large outputs back to me.
- Keep replies short: lead with the result, skip recaps of what you did.
- Ask one clarifying question instead of guessing on anything expensive to redo.

## Delegation
- Broad searches across many files → `scout` subagent (Haiku). Want the conclusion, not the file dumps.
- Multi-step features or refactors → plan first with `planner` (Opus), then implement with `builder` (Sonnet).
- Small, targeted edits → do them inline. Don't spawn a subagent for anything under ~3 steps.
- Subagents return summaries only: findings, file paths with line numbers, and next steps.

## Working style
- Make the smallest change that solves the problem. No drive-by refactors.
- Run the relevant tests/linters after changes; report only failures.
- Never commit, push, or delete files unless I ask.

## Project specifics
- Project-level CLAUDE.md files override this one. Keep detailed procedures in skills, not here.
