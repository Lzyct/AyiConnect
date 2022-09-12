import 'dart:io';

import 'package:geocoding/geocoding.dart';

extension PlaceMarkExtensions on Placemark {
  String toFormattedText() {
    return "${Platform.isAndroid ? subAdministrativeArea : locality}, $administrativeArea, $country";
  }
}
