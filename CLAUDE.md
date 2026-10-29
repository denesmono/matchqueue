# Project Overview

MatchQueue is a small private web application for organizing recurring weekly football matches among friends.

The application allows users to:
- sign in with Google
- sign up for a weekly match
- see remaining places
- join a waitlist when the match is full
- cancel their participation

Important constraints:
- Keep infrastructure costs at or near zero.
- Prefer simple solutions over infrastructure-heavy ones.
- This is a small private application, not a general-purpose SaaS product.
- Keep personal data secure and never log them.

# Technology

- Backend: Java 27
- Backend framework: ...
- Frontend: Vue + TypeScript
- Database: ...
- Build tool: ...
- Hosting: ...
- Authentication: Google OAuth
- Testing: Vitest + JUnit 6 + Mockito + ArchUnit

Do not introduce another framework or major dependency unless explicitly requested.

# About the Author

- He has almost two decades of experience in Java app development. Keep explanations of Java code brief.
- He has no JavaScript/TypeScript experience, but knows the basics of HTML and CSS. Explain the frontend code you generate with a bit more details.

# Architecture

...

# Repository Structure

- `backend/` — Java backend
- `frontend/` — Vue application
- `database/` — database migrations/schema
- `docs/` — project documentation
- `.github/` — CI configuration

When looking for functionality, start with the directory corresponding to that layer rather than searching the entire repository indiscriminately.

# Development Workflow

Before making substantial changes:
1. Inspect the relevant existing code.
2. Identify the existing pattern used by the project.
3. Prefer modifying the existing pattern over introducing a new one.
4. Make the smallest coherent change.
5. Run the relevant tests.
6. Run the full test suite when practical.
7. Report what was changed and what was tested.

Do not rewrite unrelated code merely to improve its style.

# Commands

## Backend

Run unit tests:

## Frontend

- Install dependencies: `npm ci`
- Run development server: `npm run dev`
- Run tests: `npm test`

# Coding Conventions

## Java

...

## TypeScript / Vue

- Use TypeScript rather than JavaScript.
- Follow the existing component structure.
- Keep API access separate from UI components.

# Architecture & Design Rules

- Waitlist ordering is determined by server-side timestamps.
- All state transitions affecting participation must be atomic.

# Testing

Every behavioral change should include appropriate tests.

At minimum:
- business rules must have backend unit tests
- API behavior should have integration tests where appropriate
- frontend behavior should be tested when it contains non-trivial logic

Before considering a task complete:
- run the relevant tests
- do not knowingly leave failing tests
- do not weaken or remove a test merely to make it pass

# Database

- Schema changes must be implemented through migrations.
- Never modify production schema manually.
- Do not delete historical participation records unless the retention policy explicitly requires it.
- Foreign-key relationships should be enforced by the database where practical.

# Git

- Create commits only when explicitly asked.
- Push to a remote only when explicitly asked.
- Keep existing commits unchanged.
- Do not reset, checkout, or delete user changes without confirmation.
- Preserve unrelated uncommitted changes.
- Keep changes focused on the requested task.

# Security

- Never commit secrets, API keys, OAuth credentials, or `.env` files.
- Never print secrets in logs or test output.
- Do not disable authentication or authorization checks to make tests pass.
- Do not use production credentials during local development.
- Treat all user-provided input as untrusted.

# Definition of Done

A task is complete when:

1. The requested behavior is implemented.
2. Existing behavior has not been unnecessarily changed.
3. Relevant tests pass.
4. New behavior has complete test coverage.
5. No new compiler/linter warnings have been introduced.
6. Documentation is updated when behavior or developer workflow changes.
7. The working tree contains only changes related to the task.

# References

...
