import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_app/login/login.dart';
import 'package:profile_app/profile/profile.dart';

import 'Customs/colors.dart';
import 'Widgets/TextView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    AppColors.bgColor,
                    AppColors.btng2,
                    AppColors.btng1,
                  ],
                ),
              ),
            ),
            Positioned(
              top: 15,
              child: TextView("My Profile",
                  textColor: Colors.white, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/splash_icon.png',
                width: 70,
                height: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Stream<User?> authStream = FirebaseAuth.instance.authStateChanges();

      authStream.listen((User? user) {
        if (user == null) {
          Get.offAllNamed('/login');
        } else {
          Get.offAllNamed('/profile');
        }
      });
    });
  }
}
