import 'package:flutter/material.dart';
import 'package:sssss/widgets/custom_text_field2.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: currentPasswordController,
            label: "Current Password",
            hint: "Enter your current password",
            icon: Icons.lock,
            validator: (value) {
              if (value == null || value.isEmpty)
                return "Please enter your current password";
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: newPasswordController,
            label: "New Password",
            hint: "Enter your new password",
            icon: Icons.lock_outline,
            validator: (value) {
              if (value == null || value.isEmpty)
                return "Please enter a new password";
              if (value.length < 6)
                return "Password must be at least 6 characters";
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: confirmPasswordController,
            label: "Confirm New Password",
            hint: "Confirm your new password",
            icon: Icons.lock_outline,
            validator: (value) {
              if (value == null || value.isEmpty)
                return "Please confirm your new password";
              if (value != newPasswordController.text)
                return "Passwords do not match";
              return null;
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("Processing Password Change...");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
