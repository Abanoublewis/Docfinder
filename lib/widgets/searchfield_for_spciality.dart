import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const SearchField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: const EdgeInsets.only(top: 7, bottom: 12),
            width: MediaQuery.of(context).size.width,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(59, 0, 0, 0),
                  blurRadius: 6,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: TextFormField(
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "ابحث بالتخصص",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
            ),
          ),
        ));
  }
}
