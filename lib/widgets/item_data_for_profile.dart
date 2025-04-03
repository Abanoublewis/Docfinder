import 'package:flutter/material.dart';

class ItemDataForProfile extends StatelessWidget {
  const ItemDataForProfile({
    super.key,
    required this.leading,
    this.trailing,
    required this.title,
    required this.subtitle,
  });

  final IconData leading;
  final Widget? trailing;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: trailing,
          leading: Icon(leading),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        Divider(
          color: Colors.grey.shade300,
          thickness: 2,
          indent: 16,
          endIndent: 16,
        )
      ],
    );
  }
}
