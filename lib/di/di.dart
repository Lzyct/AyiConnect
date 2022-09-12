import 'package:ayiconnect_test/data/data.dart';
import 'package:ayiconnect_test/domain/domain.dart';
import 'package:ayiconnect_test/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({bool isUnitTest = false}) async {
  /// For unit testing only
  if (isUnitTest) {
    WidgetsFlutterBinding.ensureInitialized();
    sl.reset();
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    await SharedPreferences.getInstance().then((value) {
      initPrefManager(value);
    });
    dataSources();
    repositories();
    useCases();
    cubit();
  } else {
    dataSources();
    repositories();
    useCases();
    cubit();
  }
}

// Register prefManager
void initPrefManager(SharedPreferences initPrefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(initPrefManager));
}

/// Register repositories
void repositories() {
  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(sl()),
  );
}

/// Register dataSources
void dataSources() {
  sl.registerLazySingleton<RegisterLocalDataSource>(
    () => RegisterLocalDatasourceImpl(),
  );
}

void useCases() {
  sl.registerLazySingleton(() => CurrentLocation(sl()));
}

void cubit() {
  sl.registerFactory(() => AppCubit());
  sl.registerFactory(() => RegisterCubit(sl()));
}
