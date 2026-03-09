import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreetingMessage extends StatelessWidget {
  const GreetingMessage({
    super.key,
    required this.secondMessage,
  });
  final String secondMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Progress",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              secondMessage,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.displaySmall?.color,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.dark_mode_outlined),
          color: Theme.of(context).iconTheme.color,
          iconSize: 28.sp,
        ),
      ],
    );
  }
}
