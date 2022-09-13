import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/di/di.dart';
import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await serviceLocator(isUnitTest: true);
  });

  Widget rootWidget(Widget body) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        localizationsDelegates: const [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale("en"),
        home: body,
      ),
    );
  }

  Future<void> safeTapWidgetKey(WidgetTester tester, String key) async {
    await tester.pumpAndSettle(const Duration(milliseconds: 300));
    await tester.ensureVisible(find.byKey(ValueKey(key)));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey(key)));
  }

  Future<void> safeTapWidgetText(WidgetTester tester, String text) async {
    await tester.pumpAndSettle(const Duration(milliseconds: 300));
    await tester.ensureVisible(find.text(text));
    await tester.pumpAndSettle();
    await tester.tap(find.text(text));
  }

  testWidgets("Render Main RegisterPage", (tester) async {
    await tester.pumpWidget(rootWidget(const RegisterPage()));
    /************************************
        Stepper 1
     ************************************/

    final stepperCustom1 =
        tester.widget(find.byType(StepperCustom)) as StepperCustom;

    /// Current step now should be 0
    expect(stepperCustom1.currentStep, 0);

    /// Tap button helper on step 1
    await tester.tap(find.text("Find a Helper"));

    /// Need to rebuild
    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    /************************************
        Stepper 2
     ************************************/

    final stepperCustom2 =
        tester.widget(find.byType(StepperCustom)) as StepperCustom;

    /// Current step now should be 1
    expect(stepperCustom2.currentStep, 1);

    /// Test form validator
    await safeTapWidgetText(tester, "Next");

    await tester.pump(const Duration(milliseconds: 100));

    /// More than 1 show message can't be empty
    expect(find.text("Can't be empty"), findsWidgets);

    /// Check all widget
    expect(find.byKey(const ValueKey("etFullName")), findsOneWidget);
    expect(find.byKey(const ValueKey("etBirthday")), findsOneWidget);

    /// Default value for etLocation is -
    expect(find.byKey(const ValueKey("etLocation")), findsOneWidget);

    /// Fill the full name
    await tester.enterText(
      find.byKey(const ValueKey("etFullName")),
      "Full Name",
    );

    /// Fill the date of birth using date picker
    await safeTapWidgetKey(tester, "etBirthday");
    await safeTapWidgetText(tester, "Select");

    await safeTapWidgetText(tester, "Next");

    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text("Can't be empty"), findsNothing);

    /************************************
        Stepper 3
     ************************************/

    final stepperCustom3 =
        tester.widget(find.byType(StepperCustom)) as StepperCustom;

    /// Current step now should be 2
    expect(stepperCustom3.currentStep, 2);

    /// Test form validator
    await safeTapWidgetText(tester, "Submit");

    await tester.pump(const Duration(milliseconds: 100));

    /// More than 1 show message can't be empty
    expect(find.text("Can't be empty"), findsWidgets);

    /// Check all widget
    expect(find.byKey(const ValueKey("etOccupation")), findsOneWidget);
    expect(find.byKey(const ValueKey("etCompany")), findsOneWidget);
    expect(find.byKey(const ValueKey("etLanguage")), findsOneWidget);
    expect(find.byKey(const ValueKey("etAbout")), findsOneWidget);

    await tester.enterText(
      find.byKey(const ValueKey("etOccupation")),
      "Occupation",
    );
    await tester.enterText(
      find.byKey(const ValueKey("etCompany")),
      "Company",
    );

    /// Pick language
    await safeTapWidgetKey(tester, "etLanguage");
    await safeTapWidgetText(tester, "Spanish");
    await safeTapWidgetText(tester, "Mandarin");
    await safeTapWidgetText(tester, "English");
    await safeTapWidgetKey(tester, "btnChip");
    //
    await tester.enterText(
      find.byKey(const ValueKey("etAbout")),
      "About",
    );

    await safeTapWidgetKey(tester, "btnSubmit");
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text("Can't be empty"), findsNothing);
  });
}
