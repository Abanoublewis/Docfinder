import 'package:flutter/material.dart';

class TextFieldSelectingBirthday extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onTap;

  const TextFieldSelectingBirthday({
    Key? key,
    required this.selectedDate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.grey[700]),
            const SizedBox(width: 10),
            Text(
              selectedDate == null
                  ? 'Select your birth date'
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
