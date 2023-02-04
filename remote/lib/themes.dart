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
    fontFamily: "Oskari G2",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: offBlackColor,
      ),
      displayMedium: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: offBlackColor,
      ),
      displaySmall: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: offBlackColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: offBlackColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: offBlackColor,
      ),
      titleLarge: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: offBlackColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.0,
        color: offBlackColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.0,
        color: offBlackColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: Color(0xFF262626))),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(24),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        fontSize: 24,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: offBlackColor,
        disabledForegroundColor: const Color(0xFFDDDDDD),
        disabledBackgroundColor: const Color(0xFF828282),
        textStyle: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: Colors.black)),
        minimumSize: const Size(270, 48),
      ),
    ),
    canvasColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      color: offBlackColor,
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    ),
    dividerColor: dividerColor,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return null;
      }),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(background: backgroundColor),
  );

  static final textSelectionTheme = ThemeData(
      fontFamily: "Oskari G2",
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: selectionColor,
        selectionHandleColor: primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF6F3ED)),
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(24),
        ),
        fillColor: const Color(0xFF262626),
        prefixIconColor: Colors.white,
        hintStyle: const TextStyle(color: Color(0xFFCDCDCD)),
      ));
}
