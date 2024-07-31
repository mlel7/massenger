// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.label, required this.onClick});
  final String label;
  Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: MaterialButton(
          onPressed:onClick,
          color: Theme.of(context).colorScheme.secondary,
          minWidth: double.infinity,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide.none
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ));
  }
}
