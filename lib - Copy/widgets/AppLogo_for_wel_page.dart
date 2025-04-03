import 'package:flutter/material.dart';

/// عنصر اللوجو
class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "DocFinder",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 2.0,
        shadows: [
          Shadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 3),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
