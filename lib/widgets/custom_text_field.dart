import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    Key? key,
    required this.lableText,
    required this.hintText,
    this.validator,
    this.icon,
    this.suffixIcon,
    required this.obsecureText,
    this.controller,
    this.onChanged,
    this.border,
  });
  final String? Function(String?)? validator;
  final String lableText;
  final String hintText;
  final IconData? icon;
  final bool obsecureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final InputBorder? border;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        labelText: lableText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
