import 'package:flutter/material.dart';
import 'package:sssss/widgets/user_card.dart';

class UsersDataScreen extends StatelessWidget {
  const UsersDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users Data"), backgroundColor: Colors.blue),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          UserCard(
            userName: "Ahmed",
            email: "ahmed@gmail.com",
            phone: "0112345678",
            location: "Qena",
            actions: [
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red, size: 30),
                onPressed: () {},
              ),
            ],
          ),
          UserCard(
            userName: "Ahmed",
            email: "ahmed@gmail.com",
            phone: "0112345678",
            location: "Qena",
            actions: [
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red, size: 30),
                onPressed: () {},
              ),
            ],
          ),
          UserCard(
            userName: "Ahmed",
            email: "ahmed@gmail.com",
            phone: "0112345678",
            location: "Qena",
            actions: [
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red, size: 30),
                onPressed: () {},
              ),
            ],
          ),
          UserCard(
            userName: "Ahmed",
            email: "ahmed@gmail.com",
            phone: "0112345678",
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
