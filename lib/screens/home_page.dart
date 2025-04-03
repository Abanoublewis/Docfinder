import 'package:flutter/material.dart';

import 'package:sssss/data/models/model_of_speciality.dart';
import 'package:sssss/widgets/list_tile_of_speciality.dart';
import 'package:sssss/widgets/searchfield_for_spciality.dart';
import 'package:sssss/widgets/user_app_bar.dart';

class HomePageSection extends StatelessWidget {
  final TextEditingController searchController;
  final List<ModelOfSpeciality> filteredList;
  final ValueChanged<String> onChanged;

  const HomePageSection({
    Key? key,
    required this.searchController,
    required this.filteredList,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserAppBar(),
      body: Column(
        children: [
          SearchField(
            controller: searchController,
            onChanged: onChanged,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: filteredList.isEmpty
                ? const Center(
                    child:
                        Text("لا توجد نتائج", style: TextStyle(fontSize: 18)),
                  )
                : ListView.separated(
                    separatorBuilder: (_, __) =>
                        const Divider(color: Colors.grey, thickness: 0.2),
                    itemCount: filteredList.length,
                    itemBuilder: (_, index) =>
                        ListTileOfSpeciality(textSpec: filteredList[index]),
                  ),
          ),
        ],
      ),
    );
  }
}
