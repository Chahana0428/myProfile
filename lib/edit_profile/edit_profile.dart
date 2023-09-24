import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Customs/colors.dart';
import '../Utils/storage.dart';
import '../Widgets/TextView.dart';
import '../Widgets/edit_text.dart';
import '../profile/profile.dart';
import 'edit_profile_ctrl.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileCtrl>(
      init: EditProfileCtrl(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            bool? shouldNavigate = await _showConfirmPopup(context);
            return shouldNavigate!;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Edit Profile'),
              leadingWidth: 0,
              leading: Container(),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const Text('Pick from Gallery'),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    final pickedImage =
                                        await ImagePicker().pickImage(
                                      source: ImageSource.gallery,
                                    );

                                    controller.user.profileImage =
                                        pickedImage?.path;
                                    controller.update();
                                    controller.updatedImg = pickedImage!.path;
                                    controller.update();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text('Take a Photo'),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    final pickedImage =
                                        await ImagePicker().pickImage(
                                      source: ImageSource.camera,
                                    );

                                    controller.user.profileImage =
                                        pickedImage?.path;
                                    controller.update();
                                    controller.updatedImg = pickedImage!.path;
                                    controller.update();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.btng1,
                      backgroundImage: controller.user.profileImage != null
                          ? FileImage(File(controller.user.profileImage!))
                          : null,
                      child: controller.user.profileImage == null
                          ? const Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  EditText(
                    controller: controller.nameCtrl,
                    contentPadding: const EdgeInsets.only(top: 5, left: 15),
                    inputType: TextInputType.emailAddress,
                    borderColor: Colors.black,
                    hint: "Name ",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  EditText(
                    controller: controller.skillsCtrl,
                    contentPadding: const EdgeInsets.only(top: 5, left: 15),
                    inputType: TextInputType.emailAddress,
                    borderColor: Colors.black,
                    hint: "dart , flutter ,firebase",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Skills';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  EditText(
                    controller: controller.expCtrl,
                    contentPadding: const EdgeInsets.only(top: 5, left: 15),
                    inputType: TextInputType.number,
                    borderColor: Colors.black,
                    hint: "3 year",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Work Experience';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      controller.isSave();
                      await SharedPreferencesUtil.saveUser(controller.user);
                      Get.offAndToNamed('/profile');
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
                        "Save",
                        textColor: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> _showConfirmPopup(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Leave this page without saving?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Stay on the current page
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Leave'),
            ),
          ],
        );
      },
    );
  }
}
