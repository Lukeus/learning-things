# Prompts

## Specify
"Add `GET /reports/sales.csv?from&to`. Behavior: stream CSV, headers `date,total,orders`. Max range 31 days; 429 on ranges >31d; 400 on invalid dates; 401 if not authenticated. Include 5 edge cases. Keep existing module boundaries; note required seams/refactors."

## Plan
"Propose a plan that respects current `ReportsService` and `AuthMiddleware`. Identify adapter points and minimal refactor to avoid tight coupling. Generate a migration checklist."

## Legacy Backfill
"Write a minimal spec and characterization tests for the current behavior of <brittle endpoint>. Do not change behavior; just capture it."
