import 'package:flutter/material.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({super.key, required this.icon, this.size = 24.0 , this.isSelected = false});
  final IconData icon;
  final double size ;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        // make it circular
        color: isSelected ? null : theme.dividerColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(
          size * 2
        ),
        gradient: isSelected ? LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: isSelected ? Icon(icon, color: Colors.white, size: size) : Icon(icon, color: theme.iconTheme.color, size: size) ,
      ),
    );
  }
}
