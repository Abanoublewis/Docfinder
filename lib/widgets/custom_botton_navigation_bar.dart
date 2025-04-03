import 'package:flutter/material.dart';
import 'package:sssss/constant.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BuildItemButton(
              icon: Icons.home,
              text: "Home",
              onTap: onItemTapped,
              selectedIndex: selectedIndex,
              index: 0),
          BuildItemButton(
              icon: Icons.settings,
              text: 'Settings',
              onTap: onItemTapped,
              selectedIndex: selectedIndex,
              index: 1),
          BuildItemButton(
              icon: Icons.person,
              text: 'Profile',
              onTap: onItemTapped,
              selectedIndex: selectedIndex,
              index: 2),
          BuildItemButton(
              icon: Icons.favorite,
              text: 'Favourit',
              onTap: onItemTapped,
              selectedIndex: selectedIndex,
              index: 3),
          BuildItemButton(
              icon: Icons.menu_book,
              text: "Aid Guid",
              onTap: onItemTapped,
              selectedIndex: selectedIndex,
              index: 4),
        ],
      ),
    );
  }
}

class BuildItemButton extends StatelessWidget {
  const BuildItemButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.selectedIndex,
    required this.index,
  });
  final String text;
  final IconData icon;
  final Function(int) onTap;
  final int selectedIndex;
  final int index;
  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? kPrimaryColor : Colors.grey,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? kPrimaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
