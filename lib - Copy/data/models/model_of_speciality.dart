import 'package:flutter/material.dart';

class ModelOfSpeciality {
  final String text;
  final IconData icon;

  const ModelOfSpeciality({required this.text, required this.icon});
}

const List<ModelOfSpeciality> listOfText = [
  ModelOfSpeciality(text: 'جلديه', icon: Icons.medical_services),
  ModelOfSpeciality(text: 'اسنان', icon: Icons.hearing),
  ModelOfSpeciality(text: 'نفسى', icon: Icons.face),
  ModelOfSpeciality(text: 'اطفال وحديث ولاده', icon: Icons.visibility),
  ModelOfSpeciality(text: 'عظام', icon: Icons.favorite),
  ModelOfSpeciality(text: 'نساء وتوليد', icon: Icons.medical_services),
  ModelOfSpeciality(text: 'اسنان', icon: Icons.hearing),
  ModelOfSpeciality(text: 'أنف وأذن وحنجره', icon: Icons.face),
  ModelOfSpeciality(text: 'عيون', icon: Icons.visibility),
  ModelOfSpeciality(text: 'قلب واوعيه دمويه', icon: Icons.favorite),
  ModelOfSpeciality(text: 'باطنه', icon: Icons.medical_services),
];
