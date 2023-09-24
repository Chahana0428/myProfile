import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_app/Utils/storage.dart';
import 'package:profile_app/Utils/user_model.dart';
import 'package:profile_app/profile/profile.dart';

class SignupController extends GetxController {
  TextEditingController mailCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  final key = GlobalKey<FormState>(debugLabel: "signup");
  RxBool isShow = RxBool(false);

  signup(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mailCtrl.text,
        password: passCtrl.text,
      );
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("User Created"),
          ));
          UserModel userModel = UserModel();
          userModel.email = mailCtrl.text.trim();
          userModel.name = nameCtrl.text.trim();
          userModel.name = nameCtrl.text.trim();
          SharedPreferencesUtil.saveUser(userModel);
          Get.offAll(const ProfileScreen());
        }
      });
    } catch (e) {
      print("Error during sign up: $e");
      return null;
    }
  }
}
