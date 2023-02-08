# Maps launcher for Flutter

A simple package that uses [url_launcher](https://pub.dev/packages/url_launcher) to
launch the maps app with the proper scheme on all platforms.

On iOS, map links [as specified by Apple](https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/MapLinks/MapLinks.html) are launched.
On Android, the geo intent is used as documented [here](https://developer.android.com/guide/components/intents-common.html#Maps).
For web and other platforms, the plugin will simply launch [Google Maps](https://developers.google.com/maps/documentation/urls/guide).

## Usage

```dart
import 'package:maps_launcher/maps_launcher.dart';

...

MapsLauncher.launchQuery('1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA');

MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
```

## Supported SDK versions

Consult the table provided by the [url_launcher documentation](https://pub.dev/packages/url_launcher) to see which SDK versions [maps_launcher](.) supports.