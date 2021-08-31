import 'package:e_commerce_getx/constants.dart';
import 'package:e_commerce_getx/view/widgets/custom_button.dart';
import 'package:e_commerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
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
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password', focusColor: primaryColor),
                ),
                CustomButton(
                  color: Colors.transparent,
                  child: CustomText(
                    alignment: Alignment.centerRight,
                    text: 'Forget Password',
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
                CustomButton(
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
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  child: CustomButton(
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
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  child: CustomButton(
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
    );
  }
}
