import 'package:flutter/material.dart';

import 'package:fci_project/shared/components/constants.dart';


ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: contentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    inputDecorationTheme: inputDecorationTheme.copyWith(
        fillColor: kPrimaryColor.withOpacity(0.05)),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: contentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: contentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    inputDecorationTheme: inputDecorationTheme,
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: contentColorDarkTheme.withOpacity(0.08),
  contentPadding: const EdgeInsets.symmetric(
      horizontal: defaultPadding * 1.5, vertical: defaultPadding),
  border: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
);
