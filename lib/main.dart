import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sih_v2/features/theme/build_theme.dart';
import 'package:sih_v2/features/ui/bidding/view/bid_home_page.dart';
import 'package:sih_v2/features/ui/home/view/home.dart';
import 'package:sih_v2/firebase_options.dart';
import 'features/ui/QR/transfer_package.dart';
import 'features/ui/location_selector/location_selector.dart';

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
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(context),
      home:  HomeScreen(),
    );
  }
}
