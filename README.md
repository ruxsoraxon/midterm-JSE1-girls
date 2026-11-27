# Real Landlords for Students

A student-focused Flutter app to help people in Tashkent find rooms and make
more informed decisions about who they rent from.

## Project status

The app is in early development. The current Flutter app is a welcome-screen
scaffold with Riverpod, named `go_router` navigation, and a shared Material
theme. Search, listing, landlord, and listing-management features are planned;
check the GitHub Issues for the current scoped work.

## Final-project targets

The course grading criteria guide the project scope:

- At least 35 distinct screens, reachable through app navigation, with a named
  route that passes an argument.
- A validated form and a REST API with loading, retryable error, and empty
  states.
- An AI model integrated into the app and persistent user data that survives
  restart.
- At least 10 passing unit/widget tests, clean `flutter analyze`, and useful
  `README.md` files in project directories.
- Every member makes meaningful Flutter commits in Weeks 11-14 and can demo and
  explain their own code.

These are project targets, not a claim that all features are implemented yet.

## Getting started

Install a Flutter SDK compatible with the Dart constraint in `pubspec.yaml`, and
start an emulator or connect a device:

```sh
flutter pub get
flutter run
```

Run the checks before submitting a change:

```sh
flutter analyze
flutter test
```

To regenerate platform app icons after changing the master artwork in
`assets/`, run:

```sh
dart run flutter_launcher_icons
```

## Tech stack

- Flutter and Dart
- Riverpod for app state
- `go_router` for navigation

## Team contributions

| Member | Role | Flutter screens/features implemented |
| --- | --- | --- |
| Ruxsoraxon Kenjayeva | Team lead; Flutter feature contributor | App shell, welcome screen, routing, and shared theme |
| Durdona Valiqulova | Flutter feature contributor | No Flutter feature merged yet |
| Sevinchoy Urazmatova | Flutter feature contributor | No Flutter feature merged yet |
| Gulhayo Xayitova | Flutter feature contributor | No Flutter feature merged yet |
| Shahzoda Anvarova | Flutter feature contributor | No Flutter feature merged yet |

Keep this table current as features are merged. Enter member IDSS values in the
course submission sheet, not in this repository.

## Design resources

- [Midterm project document](Midterm_JSE1_girls.pdf)
- [Midterm presentation slides](Midterm_JSE1_girls_slides.pdf)
- [Figma wireframes](https://www.figma.com/design/zDwGP1uR8OHHKpCiv3dYuY/Apartment-hunting?node-id=10-1008)
- [Wireframe exports](screenshots/)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for the project workflow, issue and PR
formats, and implementation expectations.
