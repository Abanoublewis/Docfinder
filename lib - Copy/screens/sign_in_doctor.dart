import 'package:flutter/material.dart';
import 'package:sssss/constant.dart';
import 'package:sssss/screens/signup_page.dart';
import 'package:sssss/widgets/text_field_for_email.dart';
import 'package:sssss/widgets/text_field_for_password.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header.dart';

class SignInDoctor extends StatefulWidget {
  const SignInDoctor({Key? key}) : super(key: key);

  @override
  State<SignInDoctor> createState() => _SignInState();
}

class _SignInState extends State<SignInDoctor> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
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
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 100,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Expanded(
                      child: ListView(
                        children: [
                          TextFieldForEmail(controller: emailController),
                          const SizedBox(height: 20),
                          TextFieldForPassword(controller: passwordController),
                          const SizedBox(height: 40),
                          CustomButton(
                              text: 'Sign In',
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                 
                                }
                              }),
                          const SizedBox(height: 20),
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
                                        builder: (context) => const SignUp()),
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
