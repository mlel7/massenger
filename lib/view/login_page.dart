// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massenger/controller/login_controller.dart';
import 'package:massenger/view/widgets/my_text_field.dart';
import 'widgets/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) => Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Icon(
                  Icons.message,
                  size: 110,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                // welcome back message
                Text(
                  "welcome_back_massage".tr,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18),
                ),
                const SizedBox(height: 32),
                // email text field
                MyTextField(
                  hintText: "email".tr,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmail == false) {
                      return "email_not_valid".tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                // password text field
                MyTextField(
                  hintText: "password".tr,
                  obsucureText: controller.obscureText,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "password_not_valid".tr;
                    }
                    return null;
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: IconButton(
                      onPressed: () {
                        controller.changeObsucreText();
                      },
                      icon: Icon(
                          controller.obscureText == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 25,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // login button
                MyButton(
                  label: "login".tr,
                  onClick: () async {
                    if (formKey.currentState!.validate() == true) {
                      controller.login(
                          emailController.text, passwordController.text);
                    }
                  },
                ),
                const SizedBox(height: 10),
                // register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "not_a_member".tr,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed("/register");
                      },
                      child: Text(
                        "register_now".tr,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
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
