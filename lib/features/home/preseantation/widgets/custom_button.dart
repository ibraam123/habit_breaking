import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
