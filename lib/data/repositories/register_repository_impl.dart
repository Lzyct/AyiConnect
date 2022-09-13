import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/data/data.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:ayiconnect_test/utils/ext/ext.dart';
import 'package:ayiconnect_test/utils/helper/helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class RegisterRepositoryImpl implements RegisterRepository {
  /// Data Source
  final RegisterLocalDataSource registerLocalDatasource;

  const RegisterRepositoryImpl(this.registerLocalDatasource);

  @override
  Future<Either<Failure, Location>> currentLocation({
    bool isUnitTest = false,
  }) async {
    try {
      if (isUnitTest) {
        return const Right(
          Location(name: "Makassar, Sulawesi Selatan, Indonesia"),
        );
      }
      final location = await registerLocalDatasource.currentLocation();
      log.d("Current location $location");

      /// Return only lat long for flutter web
      if (kIsWeb) {
        return Right(Location(name: location.toString()));
      }

      final List<geocoding.Placemark> placeMarks = await geocoding
          .placemarkFromCoordinates(location.latitude, location.longitude);
      final geocoding.Placemark placeMark = placeMarks[0];

      return Right(Location(name: placeMark.toFormattedText()));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
