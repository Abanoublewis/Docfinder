import 'package:flutter/material.dart';
import 'package:sssss/widgets/custom_text_field.dart';

class TextFieldForPassword extends StatefulWidget {
  const TextFieldForPassword({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<TextFieldForPassword> createState() => _TextFieldForPasswordState();
}

class _TextFieldForPasswordState extends State<TextFieldForPassword> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFeild(
      controller: widget.controller,
      lableText: "Password",
      hintText: "Enter your Password",
      icon: Icons.lock,
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
          return "Password can't be empty";
        }
        if (value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
    );
  }
}
