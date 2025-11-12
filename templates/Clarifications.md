## Open Questions
<!-- List questions that need answers before you can plan or implement. Be specific. -->

1. What should happen when a user tries to create a duplicate slug?
2. Should rate limits reset on a rolling window or fixed time intervals?
3. How should the system handle database connection failures?

## Decisions
<!-- Document the answers and rationale for each question above. -->

- **Q1 Answer:** Generate a new random slug automatically; slugs must be unique.
- **Q2 Answer:** Fixed 1-minute windows aligned to wall-clock time for simplicity.
- **Q3 Answer:** Return 503 with retry-after header; log for ops alerting.
