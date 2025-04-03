import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  final List<Map<String, dynamic>> doctors = [
    {
      "name": "د. اسماء محمود",
      "location": "مركز قنا",
      "image": "assets/WhatsApp Image 2025-02-17 at 18.54.32_99b4ce9b.jpg",
      "rating": 4.8
    },
    {
      "name": "د. اسماء محمود",
      "location": "مركز نجع حمادي",
      "image": "assets/WhatsApp Image 2025-02-17 at 18.54.32_99b4ce9b.jpg",
      "rating": 4.5
    },
    {
      "name": "د. اسماء محمود",
      "location": "مركز دشنا",
      "image": "assets/WhatsApp Image 2025-02-17 at 18.54.32_99b4ce9b.jpg",
      "rating": 4.7
    },
    {
      "name": "د. اسماء محمود",
      "location": "مركز أبوتشت",
      "image": "assets/WhatsApp Image 2025-02-17 at 18.54.32_99b4ce9b.jpg",
      "rating": 4.9
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("اختر طبيبك"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            return DoctorCard(doctor: doctors[index]);
          },
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Map<String, dynamic> doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                doctor["image"],
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.person, size: 90, color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            Text(
              doctor["name"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            Text(
              doctor["location"],
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text(
                  doctor["rating"].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
