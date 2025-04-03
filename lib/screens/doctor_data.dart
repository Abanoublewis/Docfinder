import 'package:sssss/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Doctors Data"),
        backgroundColor: Colors.blueAccent,
      ),
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
                icon: Icon(Icons.delete, color: Colors.red, size: 30),
                onPressed: () {},
              ),
            ],
          ),
          DoctorCard(
            name: "Dr. Ahmed",
            specialization: "Cardiologist",
            email: "ahmed@gmail.com",
            phone: "0123456789",
            licenseNumber: "123456",
            location: "Qena",
            actions: [
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red, size: 30),
                onPressed: () {},
              ),
            ],
          ),
          DoctorCard(
            name: "Dr. Ahmed",
            specialization: "Cardiologist",
            email: "ahmed@gmail.com",
            phone: "0123456789",
            licenseNumber: "123456",
            location: "Qena",
            actions: [
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red, size: 30),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
