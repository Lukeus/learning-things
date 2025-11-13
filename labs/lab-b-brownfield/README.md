# Lab B – Brownfield: Feature + Legacy Backfill

**Goal**: Use SDD to add a feature to an existing repo and backfill specs/tests for one legacy flow.

## Steps
1. Choose an existing service/codebase to add a feature to (your own project or a small open-source repo) and open it in VS Code.
2. Use the GitHub Spec Kit CLI (`specify`) from the VS Code integrated terminal to scaffold artifacts as needed:
   ```bash
   specify init
   specify generate spec            # For new feature
   specify generate clarifications
   specify generate plan
   specify generate tasks
   ```
3. Create `Baseline.md` using `../../templates/Baseline.md` to summarize current endpoints/domain.
4. Author `Spec.md` for the new feature (see `SCENARIO.md` for requirements); avoid large refactors in the spec.
5. Clarify → Plan → Tasks; map plan to existing modules and seams.
6. Implement incrementally in a feature branch.
7. Backfill one **LegacySpec.md** using `../../templates/LegacySpec.md` with characterization tests for a brittle endpoint.

## Definition of Done
- Feature Spec/Plan/Tasks merged; new tests passing.
- One legacy behavior documented with `LegacySpec.md` + characterization tests.
- CI green.
