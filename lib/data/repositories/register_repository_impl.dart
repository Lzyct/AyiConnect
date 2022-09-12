import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/data/data.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:ayiconnect_test/utils/ext/ext.dart';
import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class RegisterRepositoryImpl implements RegisterRepository {
  /// Data Source
  final LocationRemoteDataSource authRemoteDatasource;

  const RegisterRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, Location>> currentLocation() async {
    try {
      final location = await authRemoteDatasource.currentLocation();
      final List<geocoding.Placemark> placeMarks = await geocoding
          .placemarkFromCoordinates(location.latitude, location.longitude);
      final geocoding.Placemark placeMark = placeMarks[0];

      return Right(Location(name: placeMark.toFormattedText()));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
