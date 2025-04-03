import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String userName;
  final String email;
  final String phone;
  final String location;
  final List<Widget> actions;

  const UserCard({
    Key? key,
    required this.userName,
    required this.email,
    required this.phone,
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
              backgroundColor: Colors.blueAccent,
              radius: 35,
              child: Icon(Icons.person, color: Colors.white, size: 40),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.email, size: 18, color: Colors.blueAccent),
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
                      Icon(
                        Icons.location_city,
                        size: 18,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Location: $location",
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
