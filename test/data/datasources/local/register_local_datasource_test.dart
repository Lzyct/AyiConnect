import 'package:ayiconnect_test/di/di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_mock.mocks.dart';

void main() {
  late MockRegisterLocalDataSource mockRegisterLocalDataSource;
  setUp(() async {
    mockRegisterLocalDataSource = MockRegisterLocalDataSource();
    await serviceLocator(isUnitTest: true);
  });

  test("Should return user location", () async {
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

    final result = await mockRegisterLocalDataSource.currentLocation();

    expect(fakePosition, result);
  });
}
