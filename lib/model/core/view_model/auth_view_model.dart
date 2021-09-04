import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final _googleSignIn = GoogleSignIn(scopes: ['email']);

  final _auth = FirebaseAuth.instance;
  final _facebookLogin = FacebookAuth.instance.login();
  @override
  void onInit() {
    super.onInit();
  }

  void googleSignInMethod() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    final googleSigninAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleSigninAuth.idToken,
      accessToken: googleSigninAuth.accessToken,
    );
    final userCredential = await _auth.signInWithCredential(credential);
    print(googleUser);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
