import 'package:e_commerce_getx/helper/binding.dart';
import 'package:e_commerce_getx/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.lightGreen,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lightGreen,
        ).copyWith(),
      ),
      home: ControlView(),
    );
  }
}
