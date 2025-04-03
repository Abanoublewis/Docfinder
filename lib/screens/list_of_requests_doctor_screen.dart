import 'package:sssss/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class ListOfRequestsDoctorScreen extends StatelessWidget {
  const ListOfRequestsDoctorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Requests"), backgroundColor: Colors.blue),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          DoctorCard(
            name: "Dr. Ahmed",
            specialization: "Cardiologist",
            email: "ahmed@gmail.com",
            phone: "0123456789",
            licenseNumber: "123456",
            location: "Qena",
            actions: [
              IconButton(
                icon: Icon(Icons.check_circle, color: Colors.green, size: 30),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.red, size: 30),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
