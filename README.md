# Real Landlords for Students

A Flutter app to help students in Tashkent find rooms, distinguish landlords
from brokers, and make more informed rental decisions.

## Run locally

Install Flutter 3.x, then run:

```sh
flutter pub get
flutter run
```

Run the checks before opening a pull request:

```sh
flutter analyze
flutter test
```

The app currently has a shared Material theme, a Riverpod app root, named
`go_router` navigation, and a welcome screen. Feature-specific packages (such as
networking, persistence, and maps) should be added with the feature that needs
them. Keep API credentials on the server; do not commit secrets or put them in
the Flutter app.

## Team

| Member | Role / feature ownership | Implemented screens or features |
| --- | --- | --- |
| Ruxsoraxon Kenjayeva | Team lead; feature ownership to be agreed | App scaffold |
| Durdona Valiqulova | To be agreed | To be implemented |
| Sevinchoy Urazmatova | To be agreed | To be implemented |
| Gulhayo Xayitova | To be agreed | To be implemented |
| Shahzoda Anvarova | To be agreed | To be implemented |

Feature ownership is planned around vertical slices (UI, state/logic, data
access, and tests), not equal screen counts.

## Project material

- [Final project plan](FINAL_PROJECT_PLAN.md): proposed scope, route inventory,
  architecture, and grading checklist.
- [Midterm project document](Midterm_JSE1_girls.pdf): original problem,
  evidence, concept, and initial design.
- [Figma wireframes](https://www.figma.com/design/zDwGP1uR8OHHKpCiv3dYuY/Apartment-hunting?node-id=10-1008)
