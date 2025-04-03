import 'package:flutter/material.dart';
import 'package:sssss/widgets/custom_text_field.dart';

class TextFieldForPhone extends StatelessWidget {
  final TextEditingController controller;

  const TextFieldForPhone({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      controller: controller,
      lableText: 'Phone',
      hintText: 'Enter your phone',
      obsecureText: false,
      icon: Icons.phone,
      validator: (value) {
        if (value == null || value.isEmpty) return "Phone can't be empty";
        if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
          return "Enter a valid phone number";
        }
        return null;
      },
    );
  }
}
