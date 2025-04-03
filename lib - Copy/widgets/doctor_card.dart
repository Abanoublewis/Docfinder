import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String email;
  final String phone;
  final String licenseNumber;
  final String location;
  final List<Widget> actions;

  const DoctorCard({
    Key? key,
    required this.name,
    required this.specialization,
    required this.email,
    required this.phone,
    required this.licenseNumber,
    required this.location,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade700,
              radius: 35,
              child: Icon(Icons.person, color: Colors.white, size: 40),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.medical_services,
                        size: 18,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 6),
                      Text(
                        specialization,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.email, size: 18, color: Colors.blue),
                      SizedBox(width: 6),
                      Text(
                        email,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 18, color: Colors.blue),
                      SizedBox(width: 6),
                      Text(
                        phone,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.badge, size: 18, color: Colors.blue),
                      SizedBox(width: 6),
                      Text(
                        "License: $licenseNumber",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.location_city, size: 18, color: Colors.blue),
                      SizedBox(width: 6),
                      Text(
                        "Location:$location",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(children: actions),
          ],
        ),
      ),
    );
  }
}
