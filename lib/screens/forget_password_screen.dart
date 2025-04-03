// import 'package:flutter/material.dart';
// import 'package:sssss/screens/email_verification_screen.dart';
// import 'package:sssss/widgets/auth_buttom.dart';
// import 'package:sssss/widgets/auth_screen_layout.dart';
// import 'package:sssss/widgets/text_field_for_email.dart';

// class ForgetPasswordScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return AuthScreenLayout(
//       title: "Forgot Password",
//       subtitle: "Enter your email to receive a password reset link",
//       child: Column(
//         children: [
//           // 🔹 إدخال البريد الإلكتروني
//           TextFieldForEmail(controller: emailController),
//           const SizedBox(height: 25),

//           AuthButton(
//             text: "Recover Password",
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return EmailVerificationScreen();
//               }));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'reset_password_screen.dart'; // استيراد صفحة إعادة تعيين كلمة المرور
import 'package:sssss/widgets/text_field_for_email.dart';
class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  bool isVerificationScreen = false;

  void toggleScreen() {
    setState(() {
      isVerificationScreen = !isVerificationScreen;
    });
  }

  void navigateToResetPassword() {
    // الانتقال إلى صفحة إعادة تعيين كلمة المرور عند الضغط على Verify and Proceed
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
    );
  }

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
                      isVerificationScreen ? "Email Verification" : "Forgot Password",
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
              child: isVerificationScreen ? buildVerificationUI() : buildEmailInputUI(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmailInputUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Mail Address Here",
            style: TextStyle(
              color: Color(0xFF0A84FF), // الأزرق الطبي
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: Text(
            "Enter the email address associated with your account.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 20),
       // Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
       TextFieldForEmail(controller: emailController),
       
        SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A84FF), // الأزرق الطبي
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: toggleScreen,
            child: Text(
              "Recover Password",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildVerificationUI() {
    return Column(
      children: [
        Center(
          child: Text(
            "Enter the 4-digit code sent to your email",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text("Verification Code", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Container(
              width: 60,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: codeController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                decoration: InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white30,
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A84FF),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: navigateToResetPassword, // الانتقال إلى صفحة إعادة تعيين كلمة المرور
            child: Text(
              "Verify and Proceed",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 15),
        TextButton(
          onPressed: () {},
          child: Text(
            "Resend Code",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF0A84FF),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
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
