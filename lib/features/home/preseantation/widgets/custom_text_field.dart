import 'package:flutter/material.dart';

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
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        fillColor: theme.cardColor ,
        suffixIcon: suffixIconButton,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon),
      ).applyDefaults(theme.inputDecorationTheme),
    );
  }
}
