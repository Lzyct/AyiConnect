import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/data/datasources/datasources.dart';
import 'package:ayiconnect_test/di/di.dart';
import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:ayiconnect_test/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:oktoast/oktoast.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: kIsWeb
          ? BlocProvider(
              create: (_) => sl<AppCubit>(),
              child: BlocBuilder<AppCubit, DataHelper>(
                builder: (_, data) => FlutterWebFrame(
                  builder: (context) {
                    return MaterialApp.router(
                      routeInformationProvider:
                          AppRoute.router.routeInformationProvider,
                      routeInformationParser:
                          AppRoute.router.routeInformationParser,
                      routerDelegate: AppRoute.router.routerDelegate,
                      scrollBehavior: const MaterialScrollBehavior().copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                          PointerDeviceKind.stylus,
                          PointerDeviceKind.unknown
                        },
                      ),
                      localizationsDelegates: const [
                        Strings.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      debugShowCheckedModeBanner: false,
                      builder: (BuildContext context, Widget? child) {
                        final MediaQueryData data = MediaQuery.of(context);

                        return MediaQuery(
                          data: data.copyWith(
                            textScaleFactor: 1,
                            alwaysUse24HourFormat: true,
                          ),
                          child: child!,
                        );
                      },
                      title: Constants.get.appName,
                      theme: themeLight,
                      darkTheme: themeDark,
                      locale: Locale(data.type ?? "en"),
                      supportedLocales: L10n.all,
                      themeMode: data.activeTheme.mode,
                    );
                  },
                  maximumSize: const Size(428, 926),
                  // Maximum size
                  enabled: kIsWeb,
                  // default is enable, when disable content is full size
                  backgroundColor: Palette.border,
                ),
              ),
            )
          : ScreenUtilInit(
              /// Set screen size to make responsive
              /// Almost all device

              designSize: const Size(375, 667),
              minTextAdapt: true,
              builder: (_, __) => BlocProvider(
                create: (_) => sl<AppCubit>(),
                child: BlocBuilder<AppCubit, DataHelper>(
                  builder: (_, data) => MaterialApp.router(
                    routeInformationProvider:
                        AppRoute.router.routeInformationProvider,
                    routeInformationParser:
                        AppRoute.router.routeInformationParser,
                    routerDelegate: AppRoute.router.routerDelegate,
                    localizationsDelegates: const [
                      Strings.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    debugShowCheckedModeBanner: false,
                    builder: (BuildContext context, Widget? child) {
                      final MediaQueryData data = MediaQuery.of(context);

                      return MediaQuery(
                        data: data.copyWith(
                          textScaleFactor: 1,
                          alwaysUse24HourFormat: true,
                        ),
                        child: child!,
                      );
                    },
                    title: Constants.get.appName,
                    theme: themeLight,
                    darkTheme: themeDark,
                    locale: Locale(data.type ?? "en"),
                    supportedLocales: L10n.all,
                    themeMode: data.activeTheme.mode,
                  ),
                ),
              ),
            ),
    );
  }
}
