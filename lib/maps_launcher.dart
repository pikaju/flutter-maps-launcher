library maps_launcher;

import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsLauncher {
  /// Returns a URL that can be launched on the current platform
  /// to open a maps application showing the result of a search query.
  /// Returns `null` if the platform is not supported.
  static String createQueryUrl(String query) {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        return Uri.encodeFull('geo:0,0?q=$query');
      } else if (Platform.isIOS) {
        return Uri.encodeFull('https://maps.apple.com/?q=$query');
      }
    }
    return Uri.encodeFull(
        'https://www.google.com/maps/search/?api=1&query=$query');
  }

  /// Returns a URL that can be launched on the current platform
  /// to open a maps application showing coordinates ([latitude] and [longitude]).
  /// Returns `null` if the platform is not supported.
  static String createCoordinatesUrl(double latitude, double longitude,
      [String label]) {
    if (!kIsWeb) {
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
    }
    return Uri.encodeFull(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
  }

  /// Launches the maps application for this platform.
  /// The maps application will show the result of the provided search [query].
  /// Returns a Future that resolves to true if the maps application
  /// was launched successfully, false otherwise.
  static Future<bool> launchQuery(String query) {
    return launch(createQueryUrl(query));
  }

  /// Launches the maps application for this platform.
  /// The maps application will show the specified coordinates.
  /// Returns a Future that resolves to true if the maps application
  /// was launched successfully, false otherwise.
  static Future<bool> launchCoordinates(double latitude, double longitude,
      [String label]) {
    return launch(createCoordinatesUrl(latitude, longitude, label));
  }
}
