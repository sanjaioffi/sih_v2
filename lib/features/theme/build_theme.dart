import 'package:flutter/material.dart';

ThemeData buidAppTheme(BuildContext context) {
  return ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width - 30, 60),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple, // Set the text color
        elevation: 5, // Set the button's elevation
        padding: const EdgeInsets.all(16.0), // Set the button's padding
        textStyle: const TextStyle(
          fontFamily: 'poppins',
          fontSize: 17.0, // Set the text size
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    fontFamily: 'poppins',
  );
}
