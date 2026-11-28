# `assets/`

Runtime assets bundled with the Flutter app.

- `app_icon.png` is the opaque master artwork used to generate launcher icons.
- `app_icon_foreground.png` is the transparent foreground used for Android adaptive icons.

The root `pubspec.yaml` bundles the master image for the Linux window icon and
configures `flutter_launcher_icons` to generate platform-specific icon sizes
from the same artwork.
