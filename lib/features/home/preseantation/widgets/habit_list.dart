import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/category_entity.dart';
import 'category_container.dart';

class HabitsList extends StatefulWidget {
  const HabitsList({super.key, this.onSelected});
  final Function(CategoryEntity)? onSelected;

  @override
  State<HabitsList> createState() => _HabitsListState();
}

class _HabitsListState extends State<HabitsList> {
  final List<CategoryEntity> categoriesList = CategoryEntity.predefinedCategories;

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemCount: categoriesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            if (widget.onSelected != null) {
              widget.onSelected!(categoriesList[index]);
            }
          },
          child: CategoryContainer(
            categoryEntity: categoriesList[index],
            isSelected: selectedIndex == index,
          ),
        );
      },
    );
  }
}

