import 'package:ayiconnect_test/data/data.dart';
import 'package:ayiconnect_test/di/di.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_mock.mocks.dart';

void main() {
  late MockRegisterLocalDataSource mockRegisterLocalDataSource;
  late RegisterRepositoryImpl registerRepositoryImpl;
  late Location location;

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    mockRegisterLocalDataSource = MockRegisterLocalDataSource();
    registerRepositoryImpl =
        RegisterRepositoryImpl(mockRegisterLocalDataSource);
    location = const Location(name: "Makassar, Sulawesi Selatan, Indonesia");
  });

  test("Should return the location name", () async {
    final fakePosition = Position(
      longitude: 0.2,
      latitude: -4,
      timestamp: DateTime.now(),
      accuracy: 1,
      altitude: 1,
      heading: 1,
      speed: 1,
      speedAccuracy: 1,
    );
    when(mockRegisterLocalDataSource.currentLocation())
        .thenAnswer((_) async => fakePosition);

    final result =
        await registerRepositoryImpl.currentLocation(isUnitTest: true);

    expect(result, equals(Right(location)));
  });
}
