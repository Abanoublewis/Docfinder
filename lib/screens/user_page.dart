import 'package:flutter/material.dart';
import 'package:sssss/constant.dart';
import 'package:sssss/data/models/model_of_speciality.dart';
import 'package:sssss/screens/home_page.dart';
import 'package:sssss/screens/profile_page.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int selectedIndex = 0;
  TextEditingController searchController = TextEditingController();
  List<ModelOfSpeciality> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = List.from(listOfText);
  }

  void filterSpecialties(String query) {
    setState(() {
      filteredList = query.isEmpty
          ? List.from(listOfText)
          : listOfText.where((item) => item.text.startsWith(query)).toList();
    });
  }

  void goBackToHome() {
    setState(() {
      selectedIndex = 0;
    });
  }

  List<Widget> get _pages => [
        HomePageSection(
          searchController: searchController,
          filteredList: filteredList,
          onChanged: filterSpecialties,
        ),
        const Center(
            child: Text("Settings Page", style: TextStyle(fontSize: 20))),
        const ProfilePage(),
        const Center(
            child: Text("Favorites Page", style: TextStyle(fontSize: 20))),
        const Center(
            child: Text("Accessibility Page", style: TextStyle(fontSize: 20))),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new_outlined),
              label: 'Accessibility'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            if (index == 0) {
              searchController.clear();
              filteredList = List.from(listOfText);
            }
          });
        },
      ),
    );
  }
}
