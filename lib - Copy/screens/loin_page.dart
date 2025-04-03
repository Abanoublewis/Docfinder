import 'package:flutter/material.dart';
import 'package:sssss/constant.dart';
import 'package:sssss/data/models/user_authentication.dart';
import 'package:sssss/data/services/admin_log_in.dart';
import 'package:sssss/data/services/user_log_in.dart';
import 'package:sssss/screens/forget_password_screen.dart';
import 'package:sssss/screens/signup_page.dart';
import 'package:sssss/screens/user_page.dart';
import 'package:sssss/screens/admin_page.dart';
import 'package:sssss/widgets/custom_button.dart';
import 'package:sssss/widgets/custom_header.dart';
import 'package:sssss/widgets/text_field_for_email.dart';
import 'package:sssss/widgets/text_field_for_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> signInUser() async {
    if (_formKey.currentState?.validate() != true) return;

    setState(() => isLoading = true);

    try {
      UserAuthentication? user; // متغير يمكن أن يكون null
      bool isAdmin = false;

      // المحاولة الأولى: تسجيل الدخول كأدمن
      try {
        user = await AdminLogIn().loginAdmin(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        isAdmin = true;
      } catch (e) {
        debugPrint("Admin login failed, trying user login...");
      }

      // إذا لم يكن أدمن، نحاول تسجيل الدخول كمستخدم
      if (user == null) {
        try {
          user = await UserLogIn().loginUser(
            email: emailController.text.trim(),
            password: passwordController.text,
          );
        } catch (e) {
          throw Exception("Unauthorized: Invalid email or password.");
        }
      }

      debugPrint("✅ User Role after login: \${user.role}");
      debugPrint("✅ Token: \${user.token}");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      // الانتقال إلى الشاشة المناسبة
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => isAdmin ? DashboardScreen() : UserPage()),
      );
    } catch (e) {
      debugPrint("Login Failed: \${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString().replaceFirst("Exception:", "").trim(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
      ),
      body: Stack(
        children: [
          const CustomHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 85),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 100,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 35),
                    Expanded(
                      child: ListView(
                        children: [
                          TextFieldForEmail(controller: emailController),
                          const SizedBox(height: 20),
                         TextFieldForPassword(controller: passwordController),
const SizedBox(height: 5),

// إضافة رابط "Forget Password?"
Align(
  alignment: Alignment.centerRight,  // ضبط النص إلى اليمين
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
      );
    },
    child: const Text(
      "Forget Password?",
      style: TextStyle(
        color: Colors.redAccent,   // اللون الأحمر
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
const SizedBox(height: 40),


                          const SizedBox(height: 40),
                          CustomButton(
                            text: isLoading ? 'Loading...' : 'Sign In',
                            onPressed: isLoading ? null : signInUser,
                          ),
                          const SizedBox(height: 30),
                          Row(
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
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()),
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
