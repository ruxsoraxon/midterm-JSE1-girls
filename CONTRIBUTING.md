# Contributing

Use the course grading criteria as the primary decision guide, then follow
Flutter/Dart and community best practices. Keep each change as small and focused
as possible.

## Issues

Create one independently deliverable feature, fix, or chore per issue. Follow
the repository's existing format: a short prefixed title, a `Scope`, and
testable `Acceptance criteria`. The GitHub issue template provides this
structure.

- Use `[feature]`, `[bug]`, or `[chore]` at the start of the title, followed by
  an imperative description (for example, `[feature] Add listing search`).
- Tie the issue to one or more specific final-project grading criteria.
- Describe observable outcomes, not implementation wishes. Include relevant
  widget/unit tests in the acceptance criteria.
- Assign one member who will deliver a meaningful Flutter/Dart contribution;
  backend-only or documentation-only ownership does not satisfy the individual
  mobile-code criterion.
- Make meaningful Dart changes under each member's own GitHub account
  throughout Weeks 11-14; do not save completed work for one late bulk upload.
- Record real blockers or dependencies instead of combining unrelated work.

## Pull requests

Keep a PR focused on one issue or one tightly related vertical slice. Avoid
unrelated cleanup and generated files that are not required for the change.
Use the PR template:

- Keep the summary to a few bullets describing what changed.
- State the actual validation performed. For app changes, run
  `flutter analyze`, `flutter test`, and the app or relevant target build.
- Include a screenshot for visible UI changes when useful.
- Use `Closes #<number>` when the PR fully completes an issue. Use
  `Refs #<number>` when it only contributes part of the work.

## Flutter implementation

- Use Riverpod consistently for app state and `go_router` for navigation.
- Keep UI, state, models, and data access separate; do not put business logic in
  widgets.
- Build complete feature slices with focused tests rather than isolated
  placeholder screens.
- Network-backed UI must represent loading, retryable error, and empty states.
  Persist user data where the feature requires it.
- Keep AI credentials on a server. AI output must not determine a landlord's
  trust score.
- Add a useful `README.md` to each new project directory, as required by the
  course criteria.
- Avoid empty placeholder screens, commented-out code, and success-shaped error
  fallbacks.
- Do not commit credentials or personal IDSS values. Every member must be able
  to demo and explain the code they contribute.
