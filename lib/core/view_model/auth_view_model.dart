import 'dart:developer';

import 'package:e_commerce_getx/core/service/firestore_user.dart';
import 'package:e_commerce_getx/helper/local_storage_data.dart';
import 'package:e_commerce_getx/model/user_model.dart';
import 'package:e_commerce_getx/view/control_screen.dart';
import 'package:e_commerce_getx/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final _googleSignIn = GoogleSignIn(scopes: ['email']);
  final LocalStorageData localStorageData = Get.find();
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

    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }

  void googleSignInMethod() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    final googleSigninAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleSigninAuth.idToken,
      accessToken: googleSigninAuth.accessToken,
    );
    await _auth.signInWithCredential(credential).then((userCredential) async {
      saveUser(userCredential);
      Get.offAll(() => ControlScreen());
    });
  }

  void signInWithFacebook() async {
    final LoginResult loginResult = await _facebookLogin.login();
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((userCredential) async {
      saveUser(userCredential);
      Get.offAll(() => ControlScreen());
    });
  }

  void signInWithMail() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
        getCurrentUserData(userCredential.user!.uid);
      });
      Get.offAll(() => ControlScreen());
    } catch (e) {
      print(e);
      Get.snackbar('', e.toString());
    }
  }

  void createAccountWithMail() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
        saveUser(userCredential);
      });

      Get.offAll(() => ControlScreen());
    } catch (e) {
      print(e);
      Get.snackbar('', e.toString());
    }
  }

  void getCurrentUserData(String uid) async {
    await FirestoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromMap(value.data()!));
    });
  }

  saveUser(UserCredential userCredential) async {
    await FirestoreUser().addUserToFireStore(UserModel(
        userId: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: name == '' ? userCredential.user!.displayName! : name,
        pic: ''));
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUserData(userModel);
  }
}
