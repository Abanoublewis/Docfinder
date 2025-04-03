import 'package:flutter/material.dart';
import 'package:sssss/widgets/custom_text_field.dart';

class TextFieldForConfirmmingPassword extends StatefulWidget {
  const TextFieldForConfirmmingPassword({
    super.key,
    required this.controller,
    required this.passwordController,
  });

  final TextEditingController controller;
  final TextEditingController passwordController;

  @override
  State<TextFieldForConfirmmingPassword> createState() =>
      _TextFieldForConfirmmingPasswordState();
}

class _TextFieldForConfirmmingPasswordState
    extends State<TextFieldForConfirmmingPassword> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      controller: widget.controller,
      lableText: "Confirm Password",
      hintText: "Confirm your Password",
      obsecureText: obsecureText,
      suffixIcon: IconButton(
        icon: Icon(obsecureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            obsecureText = !obsecureText;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please confirm your password";
        }
        if (value != widget.passwordController.text) {
          return "Passwords do not match";
        }
        return null;
      },
    );
  }
}
