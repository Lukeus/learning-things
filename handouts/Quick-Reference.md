# Quick Reference – SDD with Spec Kit

## Workflow
**Flow**: Principles → Spec → Clarify → Plan → Tasks → Implement → Review

- **Principles**: A short "constitution" that sets non-negotiables (TDD, boundaries, performance budgets).
- **Spec**: Observable behavior (inputs/outputs/status codes), constraints, and 5–10 edge cases.
- **Clarify**: Targeted Q&A to remove ambiguity *before* planning.
- **Plan**: Modules, contracts, seams, risks, test strategy.
- **Tasks**: Small, testable, assignable work items.
- **Implement**: Let the assistant scaffold; keep to the plan; refactor behind clear seams.
- **Review**: Does the implementation match the spec? If not, update spec/plan and iterate.

## Common Spec Kit CLI Commands

```bash
# Initialize spec-kit in a project
spec-kit init

# Generate individual artifacts
spec-kit generate principles      # Create Project-Principles.md
spec-kit generate spec            # Create Spec.md
spec-kit generate clarifications  # Create Clarifications.md
spec-kit generate plan            # Create Plan.md
spec-kit generate tasks           # Create Tasks.md

# Validate artifacts
spec-kit validate spec            # Check spec completeness
spec-kit validate plan            # Check plan structure

# Update existing artifacts
spec-kit update spec              # Revise spec with AI assistance
spec-kit update tasks             # Update tasks based on spec changes
```

> **Note:** Actual CLI commands may vary. Refer to [GitHub Spec Kit documentation](https://github.com/github/spec-kit) for the latest syntax.
