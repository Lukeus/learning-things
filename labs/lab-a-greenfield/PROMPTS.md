# Prompts (use with your coding agent)

## Specify
"We need a public URL shortener. Users POST `{url}` to `/api/links`, receive `{slug, targetUrl}`. GET `/{slug}` 302-redirects to `targetUrl`, increments a counter. Constraints: 10 req/min per IP, slugs `[a-z0-9]{6}`, duplicate targets allowed, JSON error format `{code,message}`. Include security/abuse considerations and testable acceptance criteria. Avoid stack choices; describe behavior and constraints only."

## Clarify
"Ask targeted questions to remove ambiguity about rate-limits, storage guarantees, slug collision handling, and 5 specific edge cases."

## Plan
"Propose modules, contracts, and seams (ports/adapters). Identify risks and test strategy. Avoid premature stack decisions."

## Tasks
"Create a granular task list tied to acceptance tests."

## Implement
"Generate code that strictly follows the accepted spec, plan, and tasks. If a gap is detected, stop and ask to update the spec."
