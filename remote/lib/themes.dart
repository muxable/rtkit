import 'dart:math';

import 'package:flutter/material.dart';

const offBlackColor = Color.fromARGB(255, 38, 38, 38);
const redBackgroundColor = Color.fromARGB(255, 255, 107, 107);
const backgroundColor = Color.fromARGB(255, 22, 22, 22);
const primaryColor = Color.fromARGB(255, 223, 251, 38);
const selectionColor = Color.fromARGB(100, 223, 251, 38);
const primaryTextColor = Color.fromRGBO(246, 243, 237, 1);
const secondaryTextColor = Color.fromRGBO(246, 243, 237, 0.5);
const dividerColor = Color.fromRGBO(246, 243, 237, 0.3);
const detailColor = Color(0xFF121312);
const textFieldBgColor = Color(0xFFF6F3ED);

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.5),
    100: tintColor(color, 0.4),
    200: tintColor(color, 0.3),
    300: tintColor(color, 0.2),
    400: tintColor(color, 0.1),
    500: tintColor(color, 0),
    600: tintColor(color, -0.1),
    700: tintColor(color, -0.2),
    800: tintColor(color, -0.3),
    900: tintColor(color, -0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

class Themes {
  static final mainTheme = ThemeData(
    useMaterial3: false,
    fontFamily: "Oskari G2",
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: offBlackColor,
      ),
      headlineSmall: TextStyle(
        color: primaryTextColor,
      ),
      bodyLarge: TextStyle(
        color: primaryTextColor,
      ),
      bodyMedium: TextStyle(
        color: primaryTextColor,
      ),
      bodySmall: TextStyle(
        color: secondaryTextColor,
      ),
      titleMedium: TextStyle(
        color: primaryTextColor,
      ),
      titleSmall: TextStyle(
        color: primaryTextColor,
      ),
    ),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    canvasColor: backgroundColor,
    cardColor: backgroundColor,
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(color: primaryTextColor),
    ),
    appBarTheme: const AppBarTheme(
      color: offBlackColor,
      titleTextStyle: TextStyle(
        fontSize: 14,
        color: primaryTextColor,
        fontFamily: 'Oskari G2',
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    ),
    dividerColor: dividerColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: generateMaterialColor(primaryColor),
    ).copyWith(surface: backgroundColor),
  );
}
