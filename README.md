# Spec-Driven Development (SDD) Training

This repo teaches **Spec Kit**–style Spec-Driven Development using AI coding assistants. You’ll complete two labs:

- **Lab A – Greenfield**: Build a tiny feature from scratch using a spec → plan → tasks → implement loop.
- **Lab B – Brownfield**: Add a feature to an existing repo and backfill specs/tests for one legacy flow.

## Outcomes
- Write clear, testable specs with constraints and edge cases.
- Use structured clarification to close gaps before planning.
- Produce a technical plan and granular tasks.
- Implement with an AI assistant while keeping code faithful to the spec.
- Apply SDD to new and existing codebases.

## Prerequisites
- Git, Node.js 22 LTS, pnpm (optional) or npm.
- Access to your AI coding assistant (e.g., GitHub Copilot Chat/Agent) configured in the IDE.
- Familiarity with the **Spec Kit** workflow (commands or slash prompts).
- [GitHub Spec Kit](https://github.com/github/spec-kit) CLI available locally (installed via npm, pnpm, or your preferred package manager).

## Quick Start
```bash
# optional: use pnpm; otherwise swap to npm
pnpm install
./scripts/setup.sh        # checks Node/npm/pnpm and installs GitHub Spec Kit if missing
./scripts/print-tree.sh   # shows repo layout
```

If the automated install fails, follow the instructions in the [GitHub Spec Kit repository](https://github.com/github/spec-kit) to install or update the CLI before starting the labs.

### Dev Container (optional)
Open in VS Code and select **Reopen in Container** to auto-install tools.

## Exercises
- Start with `labs/lab-a-greenfield/README.md`.
- Then do `labs/lab-b-brownfield/README.md`.

## Definitions of Done (per lab)
- **Lab A**: Principles committed; Spec/Clarifications/Plan/Tasks authored; minimal feature passes tests in CI.
- **Lab B**: Feature Spec/Plan/Tasks merged; characterization tests for one legacy flow; CI green.

## Rubric
See `handouts/Rubric.md`.

## Notes
- If the assistant’s code drifts from the spec, revise the *spec/plan/tasks* first, then regenerate.
- Keep all artifacts versioned in-repo.
