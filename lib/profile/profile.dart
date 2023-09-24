import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_app/Utils/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Customs/colors.dart';
import '../Utils/storage.dart';
import '../Widgets/TextView.dart';
import '../edit_profile/edit_profile.dart';
import 'profile_ctrl.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileCtrl>(
      init: ProfileCtrl(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              leading: Container(),
              backgroundColor: Colors.transparent,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () async {
                      FirebaseAuth.instance.signOut();
                      if (controller.user != null) {
                        if (!controller.user!.isRemember!) {
                          controller.user!.email = null;
                          controller.user!.password = null;
                          print(
                              "isRemember-------${controller.user!.isRemember!}");
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.login_outlined,
                      color: Colors.black,
                    ),
                  ),
                )
              ]),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.user?.profileImage != null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.user?.profileImage != null
                          ? FileImage(File(controller.user!.profileImage!))
                          : null,
                    )
                  : const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white60,
                      backgroundImage: AssetImage('assets/user.png'),
                    ),
              const SizedBox(
                height: 20,
              ),
              if (controller.user != null) ...[
                detailsShow('Name', controller.user!.name ?? ''),
                detailsShow('Mail-Id', controller.user!.email ?? ''),
                detailsShow('Skill', controller.user!.skills ?? ''),
                detailsShow(
                    'Work Experience', controller.user!.workExperiences ?? '')
              ] else ...[
                detailsShow('Name', ''),
                detailsShow('Mail-Id', ''),
                detailsShow('Skill', ''),
                detailsShow('Work Experience', '')
              ],
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.offAndToNamed('/editProfile');
                },
                child: Container(
                  width: Get.width * 0.5,
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
                    "Edit",
                    textColor: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget detailsShow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextView(title),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextView(value),
          ),
        ],
      ),
    );
  }
}
