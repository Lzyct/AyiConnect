import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:flutter/material.dart';

/// Light theme
ThemeData themeLight = ThemeData(
  fontFamily: 'SF Pro Text',
  primaryColor: Palette.primary,
  disabledColor: Palette.disable,
  hintColor: Palette.hint,
  cardColor: Palette.white,
  backgroundColor: Palette.background,
  scaffoldBackgroundColor: Palette.background,
  colorScheme: const ColorScheme.light().copyWith(primary: Palette.primary),
  textTheme: TextTheme(
    headline1: TextStyles.h1,
    headline2: TextStyles.h2,
    headline3: TextStyles.h3,
    headline4: TextStyles.h4,
    headline5: TextStyles.h5,
    headline6: TextStyles.h6,
    subtitle1: TextStyles.subtitle1,
    subtitle2: TextStyles.subtitle2,
    bodyText1: TextStyles.body1,
    bodyText2: TextStyles.body2,
    caption: TextStyles.caption,
    overline: TextStyles.overline,
    button: TextStyles.button,
  ),
  appBarTheme: const AppBarTheme().copyWith(
    titleTextStyle: TextStyles.body1,
    color: Palette.primary,
    iconTheme: const IconThemeData(color: Palette.primary),
  ),
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Palette.primary),
  unselectedWidgetColor: Palette.border,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

/// Dark theme
ThemeData themeDark = ThemeData(
  fontFamily: 'SF Pro Text',
  primaryColor: Palette.primary,
  hintColor: Palette.white.withOpacity(0.75),
  colorScheme: const ColorScheme.dark().copyWith(primary: Palette.primary),
  textTheme: TextTheme(
    headline1: TextStyles.h1.copyWith(color: Palette.white),
    headline2: TextStyles.h2.copyWith(color: Palette.white),
    headline3: TextStyles.h3.copyWith(color: Palette.white),
    headline4: TextStyles.h4.copyWith(color: Palette.white),
    headline5: TextStyles.h5.copyWith(color: Palette.white),
    headline6: TextStyles.h6.copyWith(color: Palette.white),
    subtitle1: TextStyles.subtitle1.copyWith(color: Palette.white),
    subtitle2: TextStyles.subtitle2.copyWith(color: Palette.white),
    bodyText1: TextStyles.body1.copyWith(color: Palette.white),
    bodyText2: TextStyles.body2.copyWith(color: Palette.white),
    caption: TextStyles.caption.copyWith(color: Palette.white),
    overline: TextStyles.overline.copyWith(color: Palette.white),
    button: TextStyles.button.copyWith(color: Palette.white),
  ),
  appBarTheme: const AppBarTheme().copyWith(
    titleTextStyle: TextStyles.body1.copyWith(color: Palette.white),
    iconTheme: const IconThemeData(color: Palette.white),
    color: Palette.primary,
  ),
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: Palette.primary),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  cardColor: Palette.primary.withOpacity(0.75),
);

// TextStyles class
class TextStyles {
  TextStyles._();

  static TextStyle h1 = TextStyle(
    fontSize: Dimens.h1,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
    letterSpacing: -1.5,
    color: Palette.text,
  );

  static TextStyle h2 = TextStyle(
    fontSize: Dimens.h2,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
    letterSpacing: -0.5,
    color: Palette.text,
  );

  static TextStyle h3 = TextStyle(
    fontSize: Dimens.h3,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    color: Palette.text,
  );

  static TextStyle h4 = TextStyle(
    fontSize: Dimens.h4,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.25,
    color: Palette.text,
  );

  static TextStyle h5 = TextStyle(
    fontSize: Dimens.h5,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    color: Palette.text,
  );

  static TextStyle h6 = TextStyle(
    fontSize: Dimens.h6,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    letterSpacing: 0.15,
    color: Palette.text,
  );

  static TextStyle body1 = TextStyle(
    fontSize: Dimens.body1,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.5,
    color: Palette.text,
  );

  static TextStyle body2 = TextStyle(
    fontSize: Dimens.body2,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.25,
    color: Palette.text,
  );

  static TextStyle subtitle1 = TextStyle(
    fontSize: Dimens.subtitle1,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.15,
    color: Palette.text,
  );

  static TextStyle subtitle2 = TextStyle(
    fontSize: Dimens.subtitle2,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    letterSpacing: 0.1,
    color: Palette.text,
  );

  static TextStyle button = TextStyle(
    fontSize: Dimens.button,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    color: Palette.text,
    letterSpacing: -0.41,
  );

  static TextStyle caption = TextStyle(
    fontSize: Dimens.caption,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.4,
    color: Palette.text,
  );

  static TextStyle overline = TextStyle(
    fontSize: Dimens.overline,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 1.5,
    color: Palette.text,
  );
}
