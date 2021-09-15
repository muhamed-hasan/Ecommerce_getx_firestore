import 'package:e_commerce_getx/core/view_model/auth_view_model.dart';
import 'package:e_commerce_getx/core/view_model/control_view_model.dart';
import 'package:e_commerce_getx/view/auth/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: Get.put(ControlViewModel()),
              builder: (controller) => Scaffold(
                  bottomNavigationBar: _bottomNavBar(),
                  body: controller.currentScreen),
            );
    });
  }

  _bottomNavBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) {
        return BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade50,
          items: [
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Explore'),
                ),
                icon: Image.asset('assets/images/Icon_Explore.png'),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Cart'),
                ),
                icon: Image.asset('assets/images/Icon_Cart.png'),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('User'),
                ),
                icon: Image.asset('assets/images/Icon_User.png'),
                label: ''),
          ],
          currentIndex: controller.navIndex,
          onTap: (index) {
            controller.changeIndex(index);
          },
        );
      },
    );
  }
}
