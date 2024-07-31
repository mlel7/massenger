// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massenger/controller/register_controller.dart';
import 'widgets/my_button.dart';
import 'widgets/my_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (controller) => Center(
            child: Form(
              key: FormKey,
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

                  const SizedBox(height: 10),
                  // email text field
                  MyTextField(
                    hintText: "email".tr,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmail==false) {
                        return "email_not_valid".tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  // password text field
                  MyTextField(
                    validator: (value){
                    if(value!.trim().isEmpty){
                      return "password_not_valid".tr;
                    }
                    else if(value != confirmPasswordController.text){
                      return "password_not_match".tr;
                    }
                    return null;
                  },
                    hintText: "password".tr,
                    obsucureText: controller.obscureText,
                    controller: passwordController,
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
                  const SizedBox(height: 10),
                  // confirm password field
                  MyTextField(
                    validator: (value) {
                      if(value!.trim().isEmpty){
                      return "password_not_valid".tr;
                    }
                    else if(value != passwordController.text){
                      return "password_not_match".tr;
                    }
                      return null;
                    },
                    hintText: "confirm_password".tr,
                    obsucureText: true,
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 25),
                  // login button
                  MyButton(
                    label: "login".tr,
                    onClick: () {
                      if(FormKey.currentState!.validate()){
                        controller.register(emailController.text,passwordController.text);
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  // register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "have_account".tr,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed("/login");
                        },
                        child: Text(
                          "login_now".tr,
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
        ));
  }
}
