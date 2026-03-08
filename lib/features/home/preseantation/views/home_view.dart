import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_breaking/core/config/app_colors.dart';
import 'package:habit_breaking/core/config/app_routes.dart';
import 'package:habit_breaking/features/home/preseantation/widgets/container_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContainerIcon(icon: Icons.star_border_outlined , isSelected: true,size: 60,),
          SizedBox(height: 20.h),
          Text(
            "Start Your Journey",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 10.h),
          Text(
            "Break bad habits and build good ones with us!",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            text: "Add Your First Habit",
            onPressed: () {
              // Handle button press, e.g., navigate to another screen
              GoRouter.of(context).push(
                AppRoutes.kAddHabit
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // i want make gradient button with primary color and secondary color and make it rounded
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
