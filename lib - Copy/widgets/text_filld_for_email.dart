import 'package:flutter/material.dart';
import 'package:sssss/widgets/custom_text_field.dart';

class TextFieldForEmail extends StatelessWidget {
  final TextEditingController controller;

  const TextFieldForEmail({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      controller: controller,
      lableText: 'Email',
      hintText: 'Enter your Email',
      obsecureText: false,
      icon: Icons.email,
      validator: (value) {
        if (value == null || value.isEmpty) return "Email can't be empty";
        if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
            .hasMatch(value)) {
          return "Enter a valid email";
        }
        return null;
      },
    );
  }
}
