import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/data/data.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRemoteDataSource {
  Future<RegisterResponse> searchLocation(SearchLocationParams registerParams);

  Future<Position> currentLocation();
}

class LocationRemoteDatasourceImpl implements LocationRemoteDataSource {
  final DioClient _client;

  LocationRemoteDatasourceImpl(this._client);

  @override
  Future<Position> currentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      return await Geolocator.getCurrentPosition();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<RegisterResponse> searchLocation(
    SearchLocationParams registerParams,
  ) async {
    try {
      final response = await _client.postRequest(
        ListApi.register,
        data: registerParams.toJson(),
      );

      final result = RegisterResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException("Unknown error");
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
