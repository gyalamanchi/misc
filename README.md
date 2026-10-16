The zip, claude-setup.zip, has everything for your user directory. To install it, unzip it on your computer and run bash claude-setup/install.sh. That puts the files into ~/.claude/ so they apply to every project.
What’s in it:
CLAUDE.md: your global rules (the file you shared, unchanged).
agents/: three subagents.
scout runs on Haiku and does read-only searching.
planner runs on Opus and writes plans but never edits code.
builder runs on Sonnet and implements changes, then runs tests.
skills/code-review: an example skill. It reviews only the diff, so it uses far fewer tokens than reading whole files.
settings.json: sets Sonnet as the default model and blocks reads of node_modules, build output, lockfiles and .env files. Those are a common source of wasted tokens.
The installer backs up anything it replaces. It also won’t overwrite an existing settings.json, so you’d merge that one by hand. After installing, start a new session and run /agents to confirm the three subagents show up.
