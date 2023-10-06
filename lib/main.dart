import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/location_selector/location_selector.dart';
import 'package:sih_v2/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SIH V2',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width - 30, 60),
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple, // Set the text color
              elevation: 5, // Set the button's elevation
              padding: EdgeInsets.all(16.0), // Set the button's padding
              textStyle: TextStyle(
                fontFamily: 'poppins',
                fontSize: 17.0, // Set the text size
              ),
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'poppins',
        ),
        home: LocationSelector());
  }
}
