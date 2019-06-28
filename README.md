# Maps launcher for Flutter

A simple package that uses [url_launcher](https://pub.dev/packages/url_launcher) to
launch the maps app with the proper scheme on both iOS and Android.

On iOS, map links [as specified by Apple](https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/MapLinks/MapLinks.html) are launched.
On Android, the geo intent is used as documented [here](https://developer.android.com/guide/components/intents-common.html#Maps).

## Usage

```dart
import 'package:maps_launcher/maps_launcher.dart';

...

MapsLauncher.launchQuery('1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA');

MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
```