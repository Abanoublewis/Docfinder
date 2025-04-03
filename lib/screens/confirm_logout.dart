import 'package:flutter/material.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm Logout"),
      content: const Text("Are you sure you want to log out?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Yes", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}

// لاستخدامها عند الضغط على تسجيل الخروج:
void showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => LogoutConfirmationDialog(),
  );
}
