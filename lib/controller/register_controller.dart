import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  bool obscureText = true;
  changeObsucreText(){
    obscureText = !obscureText;
    update();
  }
  register(String email,String password)async{
    try{
      // create a account 
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      // save login in key
      GetStorage().write("isLogin", true);
      // navigate to home page
      Get.offNamed("/home");
    }on FirebaseAuthException catch(e){
      Get.defaultDialog(title: "Error",content: Text(e.code));
    }
  }
}