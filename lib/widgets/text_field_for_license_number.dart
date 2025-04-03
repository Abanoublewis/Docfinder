import 'package:flutter/material.dart';
import 'package:sssss/widgets/custom_text_field.dart';

class TextFieldForLicenseNumber extends StatelessWidget {
  const TextFieldForLicenseNumber({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      controller: controller,
      lableText: 'License Number',
      hintText: 'Enter your license number',
      obsecureText: false,
      icon: Icons.badge,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "License number can't be empty";
        }
        return null;
      },
    );
  }
}
