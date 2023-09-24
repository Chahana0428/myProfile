import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Customs/colors.dart';
import '../Widgets/TextView.dart';
import '../Widgets/edit_text.dart';
import 'signup_ctrl.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
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
                    "Sign Up",
                    textColor: AppColors.btng2,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                EditText(
                  controller: controller.mailCtrl,
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
                EditText(
                  controller: controller.nameCtrl,
                  contentPadding: const EdgeInsets.only(top: 5, left: 15),
                  inputType: TextInputType.text,
                  borderColor: Colors.black,
                  hint: "User name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => EditText(
                    controller: controller.passCtrl,
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
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (controller.key.currentState!.validate()) {
                      controller.signup(context);
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
                      "Sign up",
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
                      text: "Already have an Account ? ",
                      style: GoogleFonts.mooli(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      children: [
                        TextSpan(
                            text: " Login",
                            style: GoogleFonts.mooli(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: AppColors.btng2),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed('/login');
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
