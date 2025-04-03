import 'package:flutter/material.dart';
import 'package:sssss/constant.dart';
import 'package:sssss/data/services/user_register.dart';
import 'package:sssss/widgets/custom_button.dart';
import 'package:sssss/widgets/custom_header.dart';
import 'package:sssss/widgets/text_field_for_confirmming_password.dart';
import 'package:sssss/widgets/text_field_for_password.dart';
import 'package:sssss/widgets/text_field_selecting_birth_day.dart';
import 'package:sssss/widgets/text_filld_for_email.dart';
import '../widgets/text_field_for_phone.dart';
import '../widgets/text_field_for_location.dart';
import '../widgets/text_field_for_username.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obsecureText = true;
  DateTime? selectedDate;
  bool isLoading = false; // حالة تحميل عند التسجيل

  void pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> signUpUser() async {
    if (!_formKey.currentState!.validate()) return;

    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your birth date')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await UserRegister().registerUser(
        email: emailController.text.trim(),
        username: usernameController.text.trim(),
        location: locationController.text.trim(),
        phone: phoneController.text.trim(),
        birthDate: selectedDate!.toIso8601String().split('T')[0],
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      );

      print(
          'Response: ${response.message}'); // طباعة الرسالة لرؤية ما يرجعه السيرفر

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message ?? 'No message from server')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign up: ${e.toString()}')),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
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
                  children: [
                    const SizedBox(height: 35),
                    Expanded(
                      child: ListView(
                        children: [
                          TextFieldForEmail(controller: emailController),
                          const SizedBox(height: 10),
                          TextFieldForUsername(controller: usernameController),
                          const SizedBox(height: 10),
                          TextFieldForPhone(controller: phoneController),
                          const SizedBox(height: 10),
                          TextFieldForLocation(controller: locationController),
                          const SizedBox(height: 10),
                          TextFieldSelectingBirthday(
                            selectedDate: selectedDate,
                            onTap: pickDate,
                          ),
                          const SizedBox(height: 10),
                          TextFieldForPassword(controller: passwordController),
                          const SizedBox(height: 10),
                          TextFieldForConfirmmingPassword(
                              controller: confirmPasswordController,
                              passwordController: passwordController),
                          const SizedBox(height: 30),
                          CustomButton(
                            text: isLoading ? 'Loading...' : 'Create Account',
                            onPressed: isLoading ? null : signUpUser,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account? '),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 221, 106, 106),
                                      decoration: TextDecoration.underline),
                                ),
                              ),
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
