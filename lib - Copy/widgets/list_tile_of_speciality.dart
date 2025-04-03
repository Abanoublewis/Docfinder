import 'package:flutter/material.dart';

import 'package:sssss/constant.dart';
import 'package:sssss/data/models/model_of_speciality.dart';
import 'package:sssss/screens/doctors_page.dart';

class ListTileOfSpeciality extends StatelessWidget {
  final ModelOfSpeciality textSpec;

  const ListTileOfSpeciality({Key? key, required this.textSpec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        leading: Icon(textSpec.icon, color: kPrimaryColor),
        title: Text(textSpec.text, style: const TextStyle(fontSize: 18)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DoctorsPage();
              },
            ),
          );
        },
      ),
    );
  }
}
