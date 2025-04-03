import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipPath(
        clipper: CustomWaveClipper(),
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height - 50); // بداية الكيرف من أسفل اليسار
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height - 60);
    path.quadraticBezierTo(
        size.width * 0.75, size.height - 120, size.width, size.height - 80);

    path.lineTo(size.width, 0); // أغلق الشكل من الأعلى
    path.lineTo(0, 0); // أعده إلى نقطة البداية
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
