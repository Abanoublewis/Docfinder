import 'package:flutter/material.dart';
import 'package:sssss/screens/sign_in_doctor.dart';

class NavigateToSignInDoctor extends StatelessWidget {
  const NavigateToSignInDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? '),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignInDoctor()),
            );
          },
          child: const Text(
            'Sign In',
            style: TextStyle(
                color: Color.fromARGB(255, 221, 106, 106),
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
