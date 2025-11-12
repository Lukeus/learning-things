## Feature: <name>

### Summary
<!-- One-paragraph overview of what this feature does and why. -->

### User Story
<!-- As a [type of user], I want [goal] so that [benefit]. -->

### Scope / Non-Goals
**In Scope:**
- List what this feature will do

**Out of Scope (for now):**
- List what this feature explicitly won't do

### Functional Behavior

#### Endpoints / Inputs / Outputs
- `POST /api/resource` - Creates a new resource
  - Input: `{"field": "value"}`
  - Output: `{"id": "123", "field": "value"}`

#### Status Codes & Errors
- `200 OK` - Success
- `400 Bad Request` - Invalid input: `{"code": "INVALID_INPUT", "message": "..."}` 
- `429 Too Many Requests` - Rate limit exceeded

#### Data Contracts
<!-- Define exact request/response schemas. -->

### Constraints & NFRs
- Performance: Response time < 200ms p95
- Security: Rate limit 10 req/min per IP
- Data: Slugs must be unique, 6 characters `[a-z0-9]`

### Edge Cases (≥5)
1. What happens when...
2. What happens if...
3. How does the system handle...
4. What should occur when...
5. Edge case involving...

### Acceptance Criteria (testable)
- [ ] Given [context], when [action], then [expected outcome]
- [ ] System correctly handles [edge case]
- [ ] Performance meets [specific metric]
