import 'dart:developer';

import 'package:e_commerce_getx/helper/local_storage_data.dart';
import 'package:e_commerce_getx/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find<LocalStorageData>();

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void getCurrentUser() async {
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
    update();
  }
}
