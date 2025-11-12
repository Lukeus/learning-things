# Scenario – Sales CSV Export
- GET `/reports/sales.csv?from&to` streams CSV with headers `date,total,orders`
- Max range 31 days → 429 if exceeded; 400 on invalid dates; 401 when unauthenticated
- Preserve existing module boundaries; identify minimal seams/refactors
- Include 5+ edge cases and explicit acceptance criteria
