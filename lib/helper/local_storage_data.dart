import 'dart:convert';

import 'package:e_commerce_getx/constants.dart';
import 'package:e_commerce_getx/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      final userModel = await _getUserData();
      return userModel;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> _getUserData() async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(CASHED_USER_DATA);
    return UserModel.fromMap(json.decode(value!));
  }

  Future<void> setUserData(UserModel userModel) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        CASHED_USER_DATA, json.encode(userModel.toMap()));
  }

  void deleteUser() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
