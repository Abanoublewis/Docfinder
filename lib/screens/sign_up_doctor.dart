import 'package:flutter/material.dart';
import 'package:sssss/constant.dart';
import 'package:sssss/widgets/custom_button.dart';
import 'package:sssss/widgets/custom_header.dart';
import 'package:sssss/widgets/navigate_to_sign_in_doctor.dart';
import 'package:sssss/widgets/text_field_for_confirmming_password.dart';
import 'package:sssss/widgets/text_field_for_email.dart';
import 'package:sssss/widgets/text_field_for_license_number.dart';
import 'package:sssss/widgets/text_field_for_location.dart';
import 'package:sssss/widgets/text_field_for_password.dart';
import 'package:sssss/widgets/text_field_for_phone.dart';
import 'package:sssss/widgets/text_field_for_specialization.dart';
import 'package:sssss/widgets/text_field_for_username.dart';
import 'package:sssss/widgets/text_field_selecting_birth_day.dart';

class DoctorSignUp extends StatefulWidget {
  const DoctorSignUp({Key? key}) : super(key: key);

  @override
  State<DoctorSignUp> createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  DateTime? selectedDate;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Doctor Sign Up',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Stack(children: [
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
                        TextFieldForSpecialization(
                            controller: specializationController),
                        const SizedBox(height: 10),
                        TextFieldForLicenseNumber(
                            controller: licenseNumberController),
                        const SizedBox(height: 10),
                        TextFieldForPassword(controller: passwordController),
                        const SizedBox(height: 10),
                        TextFieldForConfirmmingPassword(
                            controller: confirmPasswordController,
                            passwordController: passwordController),
                        const SizedBox(height: 30),
                        CustomButton(
                            text: 'Register as Doctor',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // تنفيذ عملية التسجيل هنا
                              }
                            }),
                        const SizedBox(height: 30),
                        const NavigateToSignInDoctor(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
