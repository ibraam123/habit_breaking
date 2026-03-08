import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_breaking/features/home/domain/entities/category_entity.dart';
import 'package:habit_breaking/features/home/preseantation/views/home_view.dart';
import 'package:habit_breaking/features/home/preseantation/widgets/container_icon.dart';

import '../../../../core/config/app_colors.dart';

class AddHabitView extends StatelessWidget {
  const AddHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Habit'),
            Text(
              'What habit do you want to break?',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
      body: const AddHabitViewBody(),
    );
  }
}

class AddHabitViewBody extends StatefulWidget {
  const AddHabitViewBody({super.key});

  @override
  State<AddHabitViewBody> createState() => _AddHabitViewBodyState();
}

class _AddHabitViewBodyState extends State<AddHabitViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Habit Name',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          CustomTextFormField(hintText: 'e.g. Smoking, Nail Biting'),
          SizedBox(height: 24),
          Text(
            'Choose an icon that represents your habit',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded( child: HabitsList()),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: CustomButton(
                text: "Start Tracking",
                onPressed: (){},
            ),
          ),
          SizedBox(
            height: 36,
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              "You're about to start an amazing journey! 🌟\n Every day counts, and we'll be here to support you.",
              style:TextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 16,
          )

        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.suffixIconButton,
    this.labelText,
  });

  final String? hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconButton? suffixIconButton;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDarkMode
            ? theme.colorScheme.onSurface.withValues(alpha: 0.1)
            : theme.colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: theme.primaryColor, width: 2.w),
        ),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        ),
        suffixIcon: suffixIconButton,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, color: theme.colorScheme.onSurface),
      ),
    );
  }
}

class HabitsList extends StatefulWidget {
  const HabitsList({super.key});

  @override
  State<HabitsList> createState() => _HabitsListState();
}

class _HabitsListState extends State<HabitsList> {
  static final List<CategoryEntity> categoriesList = [
    CategoryEntity(name: 'Smoking', icon: Icons.smoking_rooms),
    CategoryEntity(name: "Social Media", icon: Icons.people),
    CategoryEntity(name: 'Junk Food', icon: Icons.fastfood_outlined),
    CategoryEntity(name: 'Caffeine', icon: Icons.local_cafe_outlined),
    CategoryEntity(name: 'Shopping', icon: Icons.shopping_cart_outlined),
    CategoryEntity(name: 'Procrastination', icon: Icons.schedule_outlined),
    CategoryEntity(name: 'Alcohol', icon: Icons.local_bar_outlined),
    CategoryEntity(name: 'Gambling', icon: Icons.casino_outlined),
  ];

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primary : Colors.grey.shade300,
          width: 2,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ContainerIcon(icon: categoryEntity.icon, isSelected: isSelected),
            SizedBox(height: 8),
            Text(
              categoryEntity.name,

              style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14.sp),
              overflow: TextOverflow.ellipsis
            ),
          ],
        ),
      ),
    );
  }
}
