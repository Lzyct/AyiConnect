import 'package:ayiconnect_test/presentation/pages/register/register.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  register("/register"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  AppRoute._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (_, __) => const RegisterPage(),
      ),
    ],
    initialLocation: Routes.register.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
  );
}
