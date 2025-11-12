# Hints
- Put rate limiting behind a port so the adapter can change later.
- Keep redirect logic pure; log/metrics via adapter.
- Prefer characterization tests for tricky behavior you discover during implementation.
