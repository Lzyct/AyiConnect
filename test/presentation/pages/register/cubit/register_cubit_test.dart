import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/di/di.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:ayiconnect_test/presentation/pages/pages.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_cubit_test.mocks.dart';

@GenerateMocks([CurrentLocation])
void main() {
  late RegisterCubit registerCubit;
  late Location location;
  late MockCurrentLocation mockCurrentLocation;

  const errorMessage = "Can't get current location";

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    location = const Location(name: "Makassar, Sulawesi Selatan, Indonesia");
    mockCurrentLocation = MockCurrentLocation();
    registerCubit = RegisterCubit(mockCurrentLocation);
  });

  tearDown(() => registerCubit.close());

  test("Initial state should be RegisterStatus.loading", () {
    expect(registerCubit.state.status, RegisterStatus.loading);
  });

  blocTest<RegisterCubit, RegisterState>(
    "When success get current location, should be return RegisterState",
    build: () {
      when(mockCurrentLocation.call(NoParams()))
          .thenAnswer((_) async => Right(location));
      return registerCubit;
    },
    act: (cubit) => cubit.currentLocation(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const RegisterState(),
      RegisterState(status: RegisterStatus.success, location: location),
    ],
  );

  blocTest<RegisterCubit, RegisterState>(
    "When failed get current location, should be return ServerFailure",
    build: () {
      when(mockCurrentLocation.call(NoParams()))
          .thenAnswer((_) async => const Left(ServerFailure(errorMessage)));
      return registerCubit;
    },
    act: (cubit) => cubit.currentLocation(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const RegisterState(),
      const RegisterState(
        status: RegisterStatus.failure,
        message: errorMessage,
      ),
    ],
  );
}
