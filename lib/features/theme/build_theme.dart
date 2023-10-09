import 'package:flutter/material.dart';

ThemeData buidAppTheme(BuildContext context) {
  return ThemeData(
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
    )),
    dividerColor: Colors.transparent,
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.all(2),
      iconColor: Color.fromRGBO(20, 28, 39, 1),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      childrenPadding: EdgeInsets.all(0),
      tilePadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width - 30, 60),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, // Set the text color
        elevation: 5, // Set the button's elevation
        padding: const EdgeInsets.all(16.0), // Set the button's padding
        textStyle: const TextStyle(
          fontFamily: 'poppins',
          fontSize: 17.0, // Set the text size
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent,
    ),
    useMaterial3: true,
    fontFamily: 'poppins',
  );
}
