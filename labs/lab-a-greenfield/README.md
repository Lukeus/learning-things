# Lab A – Greenfield: URL Shortener

**Goal**: Ship a tiny, production-shaped feature from nothing using SDD.

## Steps
1. Create a blank repo or folder for your URL shortener project and open it in VS Code. Keep this lab guide visible while you work.
2. Use the GitHub Spec Kit CLI (`specify`) from the VS Code integrated terminal to scaffold artifacts:
   ```bash
   specify init                     # Initialize Spec Kit in your project
   specify generate principles      # Generate principles template
   specify generate spec            # Generate spec template
   specify generate clarifications  # Generate clarifications template
   specify generate plan            # Generate plan template
   specify generate tasks           # Generate tasks template
   ```
3. Author `constitution/Project-Principles.md` by copying and editing `../../constitution/Project-Principles.template.md`.
4. Create `Spec.md` from `../../templates/Spec.md`, filling it out based on `SCENARIO.md` (in this directory).
   - Clarify uniqueness: slugs must be unique; multiple slugs may point to the same target URL.
5. Create `Clarifications.md` and resolve questions using your AI assistant.
6. Create `Plan.md` and `Tasks.md` with your AI assistant.
7. Implement with your AI assistant; keep code aligned to the spec.
8. Ensure tests pass; open a PR for review.

## Definition of Done
- Principles committed; Spec/Clarifications/Plan/Tasks present.
- Minimal feature works end-to-end; tests green in CI.
