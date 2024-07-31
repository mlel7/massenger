// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.hintText,
      this.obsucureText = false,
      this.icon,
      required this.controller, required this.validator});
  late String hintText;
  final obsucureText;
  final Widget? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: validator,
        autocorrect: true,
        style: const TextStyle(fontSize: 24),
        obscureText: obsucureText,
        controller: controller,
        decoration: InputDecoration(
          filled: true,

          fillColor: Theme.of(context).colorScheme.secondary,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 24),
          suffixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
