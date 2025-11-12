# Prompts (use with your coding agent)

Use these prompts with your AI assistant (GitHub Copilot, Warp Agent, Claude, etc.) at each stage of the workflow.

## 1. Specify (Creating the Spec)
**When to use:** After reading SCENARIO.md, when creating your initial Spec.md

```
We need a public URL shortener. Users POST `{url}` to `/api/links`, receive `{slug, targetUrl}`. 
GET `/{slug}` 302-redirects to `targetUrl`, increments a counter. 

Constraints: 
- 10 req/min per IP
- slugs `[a-z0-9]{6}`
- duplicate targets allowed
- JSON error format `{code,message}`

Include security/abuse considerations and testable acceptance criteria. 
Avoid stack choices; describe behavior and constraints only.
```

## 2. Clarify (Filling Clarifications.md)
**When to use:** After drafting Spec.md, before creating the plan

```
Ask targeted questions to remove ambiguity about:
- Rate-limit enforcement and reset behavior
- Storage guarantees and persistence requirements
- Slug collision handling strategy
- 5 specific edge cases that need explicit decisions
```

## 3. Plan (Creating Plan.md)
**When to use:** After clarifications are resolved, before breaking into tasks

```
Propose modules, contracts, and seams (ports/adapters). 
Identify risks and test strategy. 
Avoid premature stack decisions - focus on architectural boundaries.
```

## 4. Tasks (Creating Tasks.md)
**When to use:** After the plan is approved, before implementation

```
Create a granular task list tied to acceptance tests. 
Each task should be small, testable, and implementable independently.
```

## 5. Implement (During coding)
**When to use:** While implementing each task from Tasks.md

```
Generate code that strictly follows the accepted spec, plan, and tasks. 
If a gap is detected, stop and ask to update the spec rather than making assumptions.
```
