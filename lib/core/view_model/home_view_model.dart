import 'package:e_commerce_getx/view/cart_screen.dart';
import 'package:e_commerce_getx/view/home_screen.dart';
import 'package:e_commerce_getx/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  int _navIndex = 0;
  Widget _currentScreen = HomeScreen();

  get navIndex => _navIndex;
  get currentScreen => _currentScreen;
  changeIndex(int index) {
    _navIndex = index;
    switch (index) {
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = CartScreen();
        break;
      case 2:
        _currentScreen = ProfileScreen();
        break;
      default:
        _currentScreen = HomeScreen();
    }
    update();
  }
}
