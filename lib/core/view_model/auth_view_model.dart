import 'dart:developer';

import 'package:e_commerce_getx/view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final _googleSignIn = GoogleSignIn(scopes: ['email']);

  final _auth = FirebaseAuth.instance;
  final _facebookLogin = FacebookAuth.instance;
  String email = '', password = '', name = '';

  Rxn<User> _user = Rxn<User>();
  String? get user {
    if (_user.value == null) return null;

    return _user.value!.email;
  }

  @override
  void onInit() {
    super.onInit();
    print('init user ');
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    final googleSigninAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleSigninAuth.idToken,
      accessToken: googleSigninAuth.accessToken,
    );
    await _auth.signInWithCredential(credential);
  }

  void signInWithFacebook() async {
    final LoginResult loginResult = await _facebookLogin.login();
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  void signInWithMail() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => HomeScreen());
    } catch (e) {
      print(e);
      Get.snackbar('', e.toString());
    }
  }

  void createAccountWithMail() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(() => HomeScreen());
    } catch (e) {
      print(e);
      Get.snackbar('', e.toString());
    }
  }
}
