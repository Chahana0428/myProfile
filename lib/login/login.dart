import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_app/edit_profile/edit_profile.dart';

import '../Customs/colors.dart';
import '../Utils/storage.dart';
import '../Widgets/TextView.dart';
import '../Widgets/edit_text.dart';
import '../profile/profile.dart';
import 'login_ctrl.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: controller.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextView(
                    "Login",
                    textColor: AppColors.btng2,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                EditText(
                  controller: controller.mailctrl,
                  contentPadding: const EdgeInsets.only(top: 5, left: 15),
                  inputType: TextInputType.emailAddress,
                  borderColor: Colors.black,
                  hint: "abc@gmail.com",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Mail-Id';
                    } else if (value.isNotEmpty) {
                      if (!value.isEmail) {
                        return "Enter valid Mail-id";
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => EditText(
                    controller: controller.passctrl,
                    contentPadding: const EdgeInsets.only(top: 5, left: 15),
                    inputType: TextInputType.text,
                    borderColor: Colors.black,
                    hint: "********",
                    obscureText: !controller.isShow.value,
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.isShow.value = !controller.isShow.value;
                        },
                        icon: Icon(
                          controller.isShow.value
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Password';
                      }
                      if (value.isNotEmpty) {
                        if (value.length < 6) {
                          return "Password must be at least 6 characters long.";
                        }
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) async {
                            controller.rememberMe.value = value ?? false;
                            controller.user.isRemember =
                                controller.rememberMe.value;
                            await SharedPreferencesUtil.saveUser(
                                controller.user);
                            if (controller.rememberMe.value) {
                              controller.user.isRemember =
                                  controller.rememberMe.value;
                              await SharedPreferencesUtil.saveUser(
                                  controller.user);
                              controller.checkData();
                            }
                          },
                          activeColor: AppColors.bgColor,
                        ),
                      ),
                    ),
                    TextView("Remember me")
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (controller.key.currentState!.validate()) {
                      controller.login(context);
                    }
                  },
                  child: Container(
                    width: Get.width * 0.4,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.btng2,
                          AppColors.btng1,
                          AppColors.orange,
                        ],
                      ),
                    ),
                    child: TextView(
                      "Login",
                      textColor: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      text: "Don't have an Account ? ",
                      style: GoogleFonts.mooli(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      children: [
                        TextSpan(
                            text: " Sign Up",
                            style: GoogleFonts.mooli(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: AppColors.btng2),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed('/signup');
                              })
                      ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
