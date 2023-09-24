import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/storage.dart';
import '../Utils/user_model.dart';

class EditProfileCtrl extends GetxController {
  UserModel user = UserModel();

  TextEditingController mailCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController skillsCtrl = TextEditingController();
  TextEditingController expCtrl = TextEditingController();
  RxBool isChange = false.obs;
  String updatedImg = '';

  void getUserDetails() async {
    UserModel? savedUser = await SharedPreferencesUtil.getUser();
    if (savedUser != null) {
      user = savedUser;
      update();
    }
    if (user != null) {
      mailCtrl.text = user.email!;
      nameCtrl.text = user.name!;
      skillsCtrl.text = user.skills!;
      expCtrl.text = user.workExperiences!;
      updatedImg = user.profileImage!;
      update();
    }
  }

  isSave() {
    user.name = nameCtrl.text;
    user.email = mailCtrl.text;
    user.skills = skillsCtrl.text;
    user.workExperiences = expCtrl.text;
    user.profileImage = updatedImg;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }
}
