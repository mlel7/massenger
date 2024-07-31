import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  bool obscureText = true;
  final box = GetStorage();
  changeObsucreText() {
    obscureText = !obscureText;
    update();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  // login function
  login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      box.write("isLogin", true);
      Get.offNamed("/home");
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: "Error",content: Text(e.code));
    }
  }
}
