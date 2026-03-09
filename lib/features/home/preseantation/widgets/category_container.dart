import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/category_entity.dart';
import 'container_icon.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.categoryEntity,
    required this.isSelected,
  });

  final CategoryEntity categoryEntity;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.cardColor,
        border: Border.all(
          color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
          width: 3,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ContainerIcon(icon: categoryEntity.icon, isSelected: isSelected),
          SizedBox(height: 8),
          Text(
            categoryEntity.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                overflow: TextOverflow.ellipsis,
                color: isSelected ? theme.colorScheme.primary : theme.textTheme.bodyMedium?.color,  
            ),
          ),
        ],
      ),
    );
  }
}