import 'package:flutter/material.dart';
import 'package:sssss/widgets/custom_text_field.dart';

class TextFieldForUsername extends StatelessWidget {
  final TextEditingController controller;

  const TextFieldForUsername({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      controller: controller,
      lableText: "Username",
      hintText: "Enter your Username",
      icon: Icons.person,
      obsecureText: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Username can't be empty";
        }
        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
          return "Username must contain letters only";
        }
        if (value.length < 3) {
          return "Username must be at least 3 characters";
        }
        return null;
      },
    );
  }
}
