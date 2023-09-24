import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_app/profile/profile.dart';
import 'package:profile_app/splash.dart';

import 'Customs/colors.dart';
import 'Customs/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.bgColor),
        useMaterial3: true,
        textTheme:
            GoogleFonts.mooliTextTheme(Theme.of(context).textTheme).copyWith(
          bodyMedium: GoogleFonts.mooli(
              textStyle: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
      initialRoute: '/',
    );
  }
}
