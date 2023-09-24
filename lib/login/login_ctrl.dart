import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_app/Utils/user_model.dart';

import '../Utils/storage.dart';
import '../profile/profile.dart';

class LoginController extends GetxController {
  TextEditingController mailctrl = TextEditingController();
  TextEditingController passctrl = TextEditingController();
  final key = GlobalKey<FormState>(debugLabel: "login");
  RxBool rememberMe = RxBool(false);
  RxBool isShow = RxBool(false);
  UserModel user = UserModel();

  login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailctrl.text.trim(),
        password: passctrl.text.trim(),
      );
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("User Login not Success"),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("User Login Success"),
          ));
          print("clicked");
          Get.off(const ProfileScreen());
        }
      });
    } catch (e) {
      print("Error during sign in: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("CHECK LOGIN CREDENTIALS"),
      ));
      return null;
    }
  }

  checkData() async {
    if (rememberMe.value) {
      user.email = mailctrl.text.trim();
      user.password = passctrl.text.trim();
      update();
      await SharedPreferencesUtil.saveUser(user);
    }
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      Duration.zero,
      () async {
        UserModel? savedUser = await SharedPreferencesUtil.getUser();
        if (savedUser != null) {
          if (savedUser.isRemember!) {
            mailctrl.text = savedUser.email!;
            passctrl.text = savedUser.password!;
            rememberMe.value = savedUser.isRemember!;
            update();
          }
          update();
        }
      },
    );
  }
}
