import 'package:e_commerce_getx/view/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Container(
        child: TextButton(
            onPressed: () {
              _auth.signOut();
              Get.offAll(() => LoginScreen());
            },
            child: Text('child')),
      ),
    );
  }
}
