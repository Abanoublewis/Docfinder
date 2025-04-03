import 'package:flutter/material.dart';
import 'package:sssss/widgets/custom_text_field.dart';

class TextFieldForSpecialization extends StatelessWidget {
  const TextFieldForSpecialization({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      controller: controller,
      lableText: 'Specialization',
      hintText: 'Enter your specialization',
      obsecureText: false,
      icon: Icons.medical_services,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Specialization can't be empty";
        }
        return null;
      },
    );
  }
}
