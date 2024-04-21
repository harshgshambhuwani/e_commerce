import 'dart:ffi';

import 'package:e_commerce/app/data/app_utils.dart';
import 'package:e_commerce/app/firebase/firebase_auth.dart';
import 'package:e_commerce/app/screens/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPassController = TextEditingController();
  AuthService firebaseService = AuthService();
  var loading = false.obs;
  final User? user = AuthService().currentUser;

  Future<void> signOut() async {
    await AuthService().signOut();
  }

  ///====================================== Buttons ======================================

  Future<void> LoginBtn() async {
    if (isLoginValid()) {
      loading(true);

      final message = await firebaseService.loginAPI(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      loading(false);

      if(message.toString() == "Success"){
        Get.offAll(()=>DashBoard());
        clearLoginControllers();
      }
    }
  }

  Future<void> signupBtn() async {
    if (isRegValid()) {
      loading(true);
      final message = await firebaseService.registrationAPI(
          email: signupEmailController.text,
          password: signupPasswordController.text);
      loading(false);
      if(message.toString() == "Success"){
        Get.offAll(()=>DashBoard());
        clearSignUpControllers();
      }
    }
  }

  ///================================== Methods ==========================

  clearLoginControllers(){
    loginEmailController.clear();
    loginPasswordController.clear();
  }
  clearSignUpControllers(){
    signupEmailController.clear();
    signupPasswordController.clear();
  }

  ///====================================== Validation ======================================
  bool isLoginValid() {
    if (loginEmailController.text.isEmpty) {
      showToast(message: "Please enter email");
      return false;
    }
    if (!isEmailValid(loginEmailController.text)) {
      showToast(message: "Please enter email correctly");
      return false;
    }
    if (loginPasswordController.text.isEmpty) {
      showToast(message: "Please enter password");
      return false;
    }
    if (loginPasswordController.text.length < 6) {
      showToast(message: "Password must be greater than 5 digit");
      return false;
    }
    return true;
  }

  bool isRegValid() {
    if (signupEmailController.text.isEmpty) {
      showToast(message: "Please enter email");
      return false;
    }
    if (!isEmailValid(signupEmailController.text)) {
      showToast(message: "Please enter email correctly");
      return false;
    }
    if (signupPasswordController.text.isEmpty) {
      showToast(message: "Please enter password");
      return false;
    }
    if (signupPasswordController.text.length < 6) {
      showToast(message: "Password must be greater than 5 digit");
      return false;
    }
    if (signupConfirmPassController.text.isEmpty) {
      showToast(message: "Please enter confirm password");
      return false;
    }
    if (signupConfirmPassController.text != signupPasswordController.text) {
      showToast(message: "Password doesn't match");
      return false;
    }
    return true;
  }
}
