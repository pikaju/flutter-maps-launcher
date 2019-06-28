library maps_launcher;

import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

class MapsLauncher {
  /// Returns a URL that can be launched on the current platform
  /// to open a maps application showing the result of a search query.
  /// Returns `null` if the platform is not supported.
  static String createQueryUrl(String query) {
    if (Platform.isAndroid) {
      return Uri.encodeFull('geo:0,0?q=$query');
    } else if (Platform.isIOS) {
      return Uri.encodeFull('https://maps.apple.com/?q=$query');
    }
    return null;
  }

  /// Returns a URL that can be launched on the current platform
  /// to open a maps application showing coordinates ([latitude] and [longitude]).
  /// Returns `null` if the platform is not supported.
  static String createCoordinatesUrl(double latitude, double longitude,
      [String label]) {
    if (Platform.isAndroid) {
      return Uri.encodeFull(
        'geo:0,0?q=$latitude,$longitude' + (label == null ? '' : '($label)'),
      );
    } else if (Platform.isIOS) {
      if (label != null)
        return Uri.encodeFull(
          'https://maps.apple.com/?q=$label&ll=$latitude,$longitude',
        );
      else
        return 'https://maps.apple.com/?sll=$latitude,$longitude';
    }
    return null;
  }

  /// Launches the maps application for this platform.
  /// The maps application will show the result of the provided search [query].
  /// Returns a Future that resolves to true if the maps application
  /// was launched successfully, false otherwise.
  static Future<bool> launchQuery(String query) {
    return _launchUrl(createQueryUrl(query));
  }

  /// Launches the maps application for this platform.
  /// The maps application will show the specified coordinates.
  /// Returns a Future that resolves to true if the maps application
  /// was launched successfully, false otherwise.
  static Future<bool> launchCoordinates(double latitude, double longitude,
      [String label]) {
    return _launchUrl(createCoordinatesUrl(latitude, longitude, label));
  }

  /// Tries to launch a URL.
  /// Returns a Future that resolves to true if the URL
  /// was successfully launched, false otherwise.
  static Future<bool> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    }
    return false;
  }
}
