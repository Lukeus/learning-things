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
- Git, Node.js 22 LTS, and npm (or pnpm if preferred).
- Access to your AI coding assistant (e.g., GitHub Copilot Chat/Agent, Warp Agent, or Claude) configured in your IDE or terminal.
- Basic understanding of the **Spec Kit** workflow: a structured approach to writing specifications, plans, and tasks before implementation. See the [GitHub Spec Kit documentation](https://github.com/github/spec-kit) for details.
- [GitHub Spec Kit](https://github.com/github/spec-kit) CLI installed locally (see Quick Start below).

## Quick Start

**Choose your package manager:** Use either npm (included with Node.js) or pnpm (faster, space-efficient). All examples show both.

### Unix/macOS
```bash
# Install dependencies (choose one)
npm install
# OR
pnpm install

./scripts/setup.sh        # checks Node/npm/pnpm and installs GitHub Spec Kit if missing
./scripts/print-tree.sh   # shows repo layout
```

### Windows (PowerShell)
```powershell
# Install dependencies (choose one)
npm install
# OR
pnpm install

.\scripts\setup.ps1       # checks Node/npm/pnpm and installs GitHub Spec Kit if missing
.\scripts\print-tree.ps1  # shows repo layout
```

If the automated install fails, follow the instructions in the [GitHub Spec Kit repository](https://github.com/github/spec-kit) to install or update the CLI before starting the labs.

### Spec Kit Primer (New Users)
If you have never used Spec Kit:

1. Run `spec-kit init` inside your project directory.
2. Generate artifacts: `spec-kit generate principles spec clarifications plan tasks`.
3. Fill out each file using the templates and scenarios provided in the labs.
4. Use the clarify → plan → tasks loop before writing code.
5. Keep artifacts updated; if implementation reveals gaps, revise spec/plan/tasks first.

See the detailed command list in `handouts/Quick-Reference.md`.

### Dev Container (optional)
Open in VS Code and select **Reopen in Container** to auto-install tools.

## Exercises
Follow this sequence:

1. Start with [Lab A – Greenfield](labs/lab-a-greenfield/README.md) – build a tiny feature from scratch using the spec → plan → tasks → implement loop.
2. Then proceed to [Lab B – Brownfield](labs/lab-b-brownfield/README.md) – add a feature to an existing repo and backfill specs/tests for one legacy flow.

You can open each linked `README.md` directly and work through the steps with your AI assistant.

## Definitions of Done (per lab)
- **Lab A**: Principles committed; Spec/Clarifications/Plan/Tasks authored; minimal feature passes tests in CI.
- **Lab B**: Feature Spec/Plan/Tasks merged; characterization tests for one legacy flow; CI green.

## Rubric
See `handouts/Rubric.md`.

## Notes
- If the assistant’s code drifts from the spec, revise the *spec/plan/tasks* first, then regenerate.
- Keep all artifacts versioned in-repo.
