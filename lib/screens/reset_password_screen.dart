// import 'package:flutter/material.dart';
// import 'package:sssss/widgets/auth_buttom.dart';
// import 'package:sssss/widgets/auth_screen_layout.dart';
// import 'package:sssss/widgets/text_field_for_confirmming_password.dart';
// import 'package:sssss/widgets/text_field_for_password.dart'; // ✅ استدعاء الـ Layout

// class ResetPasswordScreen extends StatefulWidget {
//   @override
//   _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
// }

// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return AuthScreenLayout(
//       title: "Reset Password",
//       subtitle: "Enter your new password below",
//       child: Column(
//         children: [
//           TextFieldForPassword(controller: passwordController),
//           const SizedBox(height: 20),
//           TextFieldForConfirmmingPassword(
//               controller: confirmPasswordController,
//               passwordController: passwordController),
//           const SizedBox(height: 25),
//           AuthButton(
//             text: "Reset Password",
//             onPressed: () {
//               // تنفيذ إعادة التعيين
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sssss/widgets/text_field_for_confirmming_password.dart';
import 'package:sssss/widgets/text_field_for_password.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 200,
                    color: Color(0xFF0A84FF), // الأزرق الطبي
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: buildResetPasswordUI(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResetPasswordUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Enter your new password below",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text("New Password", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextFieldForPassword(controller: passwordController),
        SizedBox(height: 20),
        Text("Confirm Password", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextFieldForConfirmmingPassword(
            controller: confirmPasswordController,
             passwordController: passwordController),
        SizedBox(height: 25),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A84FF), // الأزرق الطبي
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // تنفيذ إعادة التعيين
            },
            child: Text(
              "Reset Password",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5, size.height - 30);
    path.quadraticBezierTo(size.width * 0.75, size.height - 60, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
