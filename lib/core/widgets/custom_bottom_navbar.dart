import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/nav_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final items = [
      NavItem(
        icon: Icons.home_outlined , label: "Home" ,
      ),
      // statistics icon
      NavItem(
        icon: Icons.analytics_outlined , label: "Statistics" ,
      ),
      // Achievements icon
      NavItem(
        icon: Icons.card_giftcard_outlined , label: "Rewards" ,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = widget.currentIndex == index;

          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => widget.onItemTapped(index),
            splashColor: theme.primaryColor.withValues(alpha: 0.1),
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(vertical: 8.w),
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 16.w : 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.primaryColor.withValues(alpha: 0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTheme(
                    data: ThemeData(
                      iconTheme: IconThemeData(
                        color: isSelected
                            ? theme.primaryColor
                            : theme.unselectedWidgetColor,
                        size: 24.r,
                      ),
                    ),
                    duration: const Duration(milliseconds: 300),
                    child: Icon(item.icon),
                  ),
                  if (isSelected) const SizedBox(height: 3),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      fontSize: 12.sp ,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? theme.primaryColor
                          : theme.unselectedWidgetColor,
                    ),
                    child: Text(item.label),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}