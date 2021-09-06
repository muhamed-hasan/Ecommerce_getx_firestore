import 'package:e_commerce_getx/constants.dart';
import 'package:e_commerce_getx/model/core/view_model/auth_view_model.dart';
import 'package:e_commerce_getx/view/widgets/custom_button.dart';
import 'package:e_commerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
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
                      color: Colors.transparent,
                      child: CustomText(
                        alignment: Alignment.center,
                        text: 'SIGN UP',
                        size: 16,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomText(
                  text: 'Sign in to continue',
                  color: Colors.grey,
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email', hintText: 'name@mail.com'),
                      onSaved: (newValue) => controller.email = newValue ?? '',
                      validator: (value) {
                        if (value == '') {
                          print('object');
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
                        //TODO
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
                          controller.signInWithMail();
                        }
                      },
                      child: CustomText(
                        alignment: Alignment.center,
                        text: 'SIGN IN',
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('-OR-'),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),
                      child: CustomButton(
                        onTap: () {
                          controller.signInWithFacebook();
                        },
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Image.asset('assets/images/facebook.png'),
                            SizedBox(width: 50),
                            Text('Sign In with Facebook')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),
                      child: CustomButton(
                        onTap: () {
                          controller.googleSignInMethod();
                        },
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Image.asset('assets/images/google.png'),
                            SizedBox(width: 50),
                            Text('Sign In with Facebook')
                          ],
                        ),
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
