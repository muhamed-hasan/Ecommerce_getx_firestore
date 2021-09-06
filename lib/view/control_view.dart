import 'package:e_commerce_getx/core/view_model/auth_view_model.dart';
import 'package:e_commerce_getx/view/auth/login_screen.dart';
import 'package:e_commerce_getx/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeScreen()
          : LoginScreen();
    });
  }
}
