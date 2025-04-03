import 'package:flutter/material.dart';

/// خلفية بتدرج ألوان أزرق حديث
class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: /* [Color(0xFF1E3C72), Color(0xFF2A5298)]*/ [
            Color.fromARGB(255, 10, 83, 142),
            Color.fromARGB(255, 65, 117, 181)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
