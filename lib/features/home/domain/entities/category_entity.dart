import 'package:flutter/material.dart';

class CategoryEntity {
  final String name;
  final IconData icon;

  CategoryEntity({
    required this.name,
    required this.icon,
  });

  static final List<CategoryEntity> predefinedCategories = [
    CategoryEntity(name: 'Smoking', icon: Icons.smoking_rooms),
    CategoryEntity(name: "Social", icon: Icons.people),
    CategoryEntity(name: 'Food', icon: Icons.fastfood_outlined),
    CategoryEntity(name: 'Caffeine', icon: Icons.local_cafe_outlined),
    CategoryEntity(name: 'Shopping', icon: Icons.shopping_cart_outlined),
    CategoryEntity(name: 'Procrastination', icon: Icons.schedule_outlined),
    CategoryEntity(name: 'Alcohol', icon: Icons.local_bar_outlined),
    CategoryEntity(name: 'Gambling', icon: Icons.casino_outlined),
    CategoryEntity(name: 'Porn', icon: Icons.warning_amber_outlined),
  ];

  static IconData getIconByName(String name) {
    return predefinedCategories.firstWhere((element) => element.name == name, orElse: () => predefinedCategories.first).icon;
  }
}