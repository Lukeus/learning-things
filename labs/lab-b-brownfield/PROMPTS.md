# Prompts (use with your coding agent)

Use these prompts with your AI assistant at each stage when working in an existing codebase.

## 1. Specify (Creating the Feature Spec)
**When to use:** After reading SCENARIO.md and understanding the existing codebase

```
Add `GET /reports/sales.csv?from&to`. 

Behavior: 
- Stream CSV with headers `date,total,orders`
- Max range 31 days
- 429 on ranges >31d
- 400 on invalid dates
- 401 if not authenticated

Include 5 edge cases. 
Keep existing module boundaries; note any required seams or minimal refactors needed.
```

## 2. Plan (Creating Plan.md)
**When to use:** After spec and clarifications, when mapping to existing architecture

```
Propose a plan that respects the current `ReportsService` and `AuthMiddleware`. 
Identify adapter points and minimal refactor needed to avoid tight coupling. 
Generate a migration checklist if database or breaking changes are needed.
```

## 3. Legacy Backfill (Creating LegacySpec.md)
**When to use:** When documenting existing behavior before refactoring or alongside new work

```
Write a minimal spec and characterization tests for the current behavior of <brittle endpoint>. 
Do not change behavior; just capture it exactly as it exists today.
Focus on observable inputs/outputs, including edge cases and error conditions.
```
