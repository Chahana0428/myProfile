import 'package:get/get.dart';

import '../Utils/storage.dart';
import '../Utils/user_model.dart';

class ProfileCtrl extends GetxController {
  UserModel? user;

  void getUserDetails() async {
    UserModel? savedUser = await SharedPreferencesUtil.getUser();
    if (savedUser != null) {
      user = savedUser;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }
}
