# Lab B – Brownfield: Feature + Legacy Backfill

**Goal**: Use SDD to add a feature to an existing repo and backfill specs/tests for one legacy flow.

## Steps
1. Attach this training to an existing service (or use `sample-repo/`).
2. Use the GitHub Spec Kit CLI to scaffold Baseline, Spec, Clarifications, Plan, Tasks, and Legacy artifacts as you progress.
3. Create `Baseline.md` summarizing current endpoints/domain.
4. Author `Spec.md` for the new feature; avoid large refactors in the spec.
5. Clarify → Plan → Tasks; map plan to existing modules and seams.
6. Implement incrementally in a feature branch.
7. Backfill one **LegacySpec.md** with characterization tests for a brittle endpoint.

## Definition of Done
- Feature Spec/Plan/Tasks merged; new tests passing.
- One legacy behavior documented with `LegacySpec.md` + characterization tests.
- CI green.
