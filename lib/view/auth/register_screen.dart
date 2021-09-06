import 'package:e_commerce_getx/constants.dart';
import 'package:e_commerce_getx/core/view_model/auth_view_model.dart';
import 'package:e_commerce_getx/view/auth/login_screen.dart';
import 'package:e_commerce_getx/view/widgets/custom_button.dart';
import 'package:e_commerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Welcome',
                      size: 30,
                    ),
                    CustomButton(
                      onTap: () {
                        Get.offAll(() => LoginScreen());
                      },
                      color: Colors.transparent,
                      child: CustomText(
                        alignment: Alignment.center,
                        text: 'SIGN IN',
                        size: 16,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomText(
                  text: 'Sign Up',
                  color: Colors.grey,
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Name', hintText: 'Mohamed Hasan'),
                      onSaved: (newValue) => controller.name = newValue ?? '',
                      validator: (value) {
                        if (value == '' || value!.length < 3) {
                          return 'Enter Name';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email', hintText: 'name@mail.com'),
                      onSaved: (newValue) => controller.email = newValue ?? '',
                      validator: (value) {
                        if (value == '' || value!.length < 3) {
                          return 'Enter Valid Mail';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password', focusColor: primaryColor),
                      onSaved: (newValue) =>
                          controller.password = newValue ?? '',
                      validator: (value) {
                        if (value == '' || value!.length < 3) {
                          return 'Enter Password';
                        }
                      },
                    ),
                    CustomButton(
                      color: Colors.transparent,
                      onTap: () {},
                      child: CustomText(
                        alignment: Alignment.centerRight,
                        text: 'Forget Password',
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.createAccountWithMail();
                        }
                      },
                      child: CustomText(
                        alignment: Alignment.center,
                        text: 'SIGN UP',
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
