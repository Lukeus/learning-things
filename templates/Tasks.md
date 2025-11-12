<!-- Each task should be small, testable, and implementable in isolation. -->
<!-- Link tasks to acceptance criteria from the spec. -->

## Setup & Infrastructure
- [ ] Create project structure and initial configuration
- [ ] Set up test framework and CI pipeline

## Core Features
- [ ] Implement slug generation (test: generates 6-char alphanumeric slugs)
- [ ] Implement link creation endpoint (test: POST /api/links returns slug)
- [ ] Implement redirect endpoint (test: GET /{slug} redirects to target URL)
- [ ] Implement hit counter (test: redirect increments counter)

## Rate Limiting
- [ ] Implement rate limiter (test: allows 10 req/min per IP)
- [ ] Return 429 when rate exceeded (test: 11th request in minute returns 429)

## Error Handling
- [ ] Handle invalid URLs (test: POST with invalid URL returns 400)
- [ ] Handle missing slugs (test: GET /nonexistent returns 404)

## Edge Cases
- [ ] Handle slug collision (test: retry generation on collision)
- [ ] Handle concurrent requests (test: race conditions handled)
