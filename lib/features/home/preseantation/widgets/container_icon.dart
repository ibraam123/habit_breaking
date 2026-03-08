import 'package:flutter/material.dart';
import 'package:habit_breaking/core/config/app_colors.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({super.key, required this.icon, this.size = 24.0 , this.isSelected = false});
  final IconData icon;
  final double size ;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // make it circular
        color: isSelected ? null : Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(
          size * 2
        ),
        gradient: isSelected ? LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: isSelected ? Icon(icon, color: Colors.white, size: size) : Icon(icon, color: Colors.blueGrey, size: size) ,
      ),
    );
  }
}
