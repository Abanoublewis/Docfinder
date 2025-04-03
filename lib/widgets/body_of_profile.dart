import 'package:flutter/material.dart';
import 'package:sssss/screens/change_password_screen.dart';
import 'package:sssss/widgets/item_data_for_profile.dart';

class BodyOfProfile extends StatelessWidget {
  const BodyOfProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          child: Container(
            height: 260,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 81, 111, 222),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 12,
                  left: 12,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(55),
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/personalphoto.jpg",
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Ahmed Hassan',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Ahmed@gmail.com',
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              const ItemDataForProfile(
                title: "Username",
                subtitle: "Ahmed Hassan",
                leading: Icons.person,
              ),
              const ItemDataForProfile(
                leading: Icons.email,
                title: "Email",
                subtitle: "Ahmed@gmail.com",
              ),
              ItemDataForProfile(
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChangePasswordScreen();
                    }));
                  },
                ),
                title: "Password",
                subtitle: "34567899",
                leading: Icons.lock,
              ),
              const ItemDataForProfile(
                leading: Icons.mobile_friendly,
                title: "Phone",
                subtitle: "01024180488",
              ),
              const ItemDataForProfile(
                title: "Location",
                subtitle: "Qena",
                leading: Icons.location_city,
              ),
              const ItemDataForProfile(
                leading: Icons.calendar_today,
                title: "Birthday",
                subtitle: "2/2/2002",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
