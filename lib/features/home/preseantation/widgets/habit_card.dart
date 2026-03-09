import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/habit_entity.dart';

class HabitCard extends StatelessWidget {
  final IconData icon;
  final HabitEntity habit;
  final String statusText;
  final Color statusColor;
  final VoidCallback? onDelete;
  final VoidCallback? onStatusPressed;

  const HabitCard({
    super.key,
    required this.icon,
    required this.statusText,
    required this.statusColor,
    this.onDelete,
    this.onStatusPressed, required this.habit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
            blurRadius: 10.r,
            spreadRadius: 2.r,
            offset: Offset(0, 5.h),
          )
        ],
      ),
      child: Column(
        children: [
          // Top Row: Icon + title + delete
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).dividerColor,
                radius: 20.r,
                child: Icon(icon, color: Theme.of(context).iconTheme.color, size: 20.sp),
              ),
              SizedBox(width: 12.w),
              Text(
                habit.name,
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              const Spacer(),
              if (onDelete != null)
                IconButton(
                  onPressed: onDelete,
                  icon:Icon(Icons.delete, color: Colors.red, size: 20.sp),
                )
            ],
          ),

          SizedBox(height: 20.h),

          // Center: Emoji + days
          Column(
            children: [
              Text(
                "✨",
                style: TextStyle(fontSize: 32.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                "${habit.days}",
                style:
                TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "Days",
                style: TextStyle(fontSize: 12.sp, color: Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Status Button
          GestureDetector(
            onTap: onStatusPressed,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                border: Border.all(color: statusColor),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    statusColor == Colors.red
                        ? Icons.error_outline
                        : Icons.check_circle_outline,
                    color: statusColor,
                    size: 20.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    statusText,
                    style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}