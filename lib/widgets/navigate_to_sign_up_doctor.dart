import 'package:flutter/material.dart';
import 'package:sssss/screens/sign_up_doctor.dart';

class NavigateToSignUpDoctor extends StatelessWidget {
  const NavigateToSignUpDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DoctorSignUp()),
            );
          },
          child: const Text(
            'Sign up',
            style: TextStyle(
              color: Colors.redAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
