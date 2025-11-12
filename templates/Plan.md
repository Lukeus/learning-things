## Architecture
<!-- Describe the high-level structure. Avoid premature technology choices. -->

### Modules & Responsibilities
- **LinkService**: Core business logic for creating/retrieving links
- **RateLimiter**: Enforces rate limits per IP
- **LinkRepository**: Storage abstraction for link data

### Ports/Adapters and Seams
- **Port:** `ILinkRepository` interface
- **Adapter:** In-memory or database implementation
- **Seam:** Rate limiting can be swapped (Redis, in-memory, etc.)

## Data & Contracts
<!-- Define key data structures and interfaces. -->

```typescript
interface Link {
  slug: string;
  targetUrl: string;
  hitCount: number;
}
```

## Risks & Mitigations
| Risk | Impact | Mitigation |
|------|--------|------------|
| Slug collisions | Medium | Retry generation with exponential backoff |
| Rate limit bypass | High | Store per-IP counts with TTL |

## Test Strategy
- **Unit tests:** Core business logic (slug generation, validation)
- **Integration tests:** API endpoints with test database
- **Performance tests:** Rate limiting under load
