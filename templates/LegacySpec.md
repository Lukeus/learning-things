## Legacy Behavior: <area>
<!-- Document existing behavior exactly as it is, not as it should be. -->

### Summary of Current Behavior
<!-- Describe what the code currently does, including quirks. -->

The `/legacy/endpoint` currently accepts POST requests with `{field1, field2}` and returns status 200 with `{id, timestamp}`. However, it returns 200 even when database writes fail, logging errors silently.

### Characterization Tests
<!-- Tests that capture current behavior without changing it. -->

- [ ] Test: POST with valid data returns 200
- [ ] Test: Response includes id and timestamp fields
- [ ] Test: Returns 200 even when database is unavailable (captures current bug)
- [ ] Test: Invalid field1 format returns 200 with null id (captures quirk)

### Known Risks
<!-- Document risks if this behavior changes or when refactoring. -->

- Some clients may depend on the 200-on-failure behavior
- The null-id quirk might be used as a signal by downstream systems
- No retry logic exists; failures are silent
