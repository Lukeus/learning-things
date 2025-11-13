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

## Common Spec Kit CLI Commands (`specify`)

```bash
# Initialize Spec Kit in a project
specify init

# Generate individual artifacts
specify generate principles      # Create Project-Principles.md
specify generate spec            # Create Spec.md
specify generate clarifications  # Create Clarifications.md
specify generate plan            # Create Plan.md
specify generate tasks           # Create Tasks.md

# Validate artifacts
specify validate spec            # Check spec completeness
specify validate plan            # Check plan structure

# Update existing artifacts
specify update spec              # Revise spec with AI assistance
specify update tasks             # Update tasks based on spec changes
```

> **Note:** Actual CLI commands may vary. Refer to [GitHub Spec Kit documentation](https://github.com/github/spec-kit) for the latest syntax.
