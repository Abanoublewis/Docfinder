import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class TextFieldForCode extends StatelessWidget {
//   final TextEditingController controller;

//   const TextFieldForCode({Key? key, required this.controller})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.white30),
//       ),
//       child: TextField(
//         controller: controller,
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         maxLength: 4,
//         inputFormatters: [
//           FilteringTextInputFormatter.digitsOnly, // 🔹 يسمح فقط بالأرقام
//           LengthLimitingTextInputFormatter(4), // 🔹 يمنع إدخال أكثر من 4 أرقام
//         ],
//         style: const TextStyle(
//             color: Colors.white, fontSize: 22, letterSpacing: 10),
//         decoration: const InputDecoration(
//           border: InputBorder.none,
//           counterText: "", // 🔹 إخفاء عداد الحروف
//           hintText: "● ● ● ●", // 🔹 نقاط إرشادية
//           hintStyle:
//               TextStyle(color: Colors.white54, fontSize: 22, letterSpacing: 10),
//         ),
//       ),
//     );
//   }
// }
