# Scenario – Public URL Shortener
- POST `/api/links` with `{url}` → returns `{slug, targetUrl}`
- GET `/{slug}` → 302 redirect; increments a counter
- Constraints: 10 req/min per IP; slug `[a-z0-9]{6}`; duplicates allowed
- JSON error shape: `{code, message}`; rate-limit breaches return 429
- Include security/abuse considerations and 5+ edge cases
