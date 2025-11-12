# Mentor Guide

## Key Teaching Points
- **Push for specificity:** Require exact status codes, error shapes `{code, message}`, and performance budgets (e.g., "< 200ms p95").
- **Force the clarify step:** Ambiguity in specs becomes rework during implementation. Make learners ask questions before planning.
- **Keep artifacts in-repo:** Review specs, plans, and tasks in PRs just like you review code.
- **Demonstrate agent-agnostic use:** Show the workflow with multiple AI assistants (e.g., GitHub Copilot + Warp Agent, or Claude + Cursor) to emphasize that SDD works regardless of the tool.

## What "Agent-Agnostic" Means
The Spec-Driven Development workflow should work with any AI coding assistant:
- **GitHub Copilot Chat/Agent**: Use slash commands or chat prompts
- **Warp Agent**: Use natural language in the terminal
- **Claude/Cursor**: Use chat interface or IDE integration
- **Other tools**: Any tool that can read specs and generate code

The key is that the *process* (spec → clarify → plan → tasks → implement) remains the same, regardless of which AI tool generates the code.
