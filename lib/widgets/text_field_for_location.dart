import 'package:flutter/material.dart';

class TextFieldForLocation extends StatelessWidget {
  final TextEditingController controller;

  const TextFieldForLocation({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Location',
        hintText: 'Enter your location',
        prefixIcon: const Icon(Icons.location_on),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
