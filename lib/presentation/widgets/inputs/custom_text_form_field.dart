// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CustomTextFormFiel extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final IconData? prefixIcon;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormFiel(
      {super.key,
      this.label,
      this.hintText,
      this.errorText,
      this.prefixIcon,
      this.onChanged,
      this.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: colors.primary),
    );

    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.error),
        ),
        isDense: true,
        // label: Text('Username', style: TextStyle(color: colors.primary)),
        labelText: label,
        hintText: hintText,
        errorText: errorText,
        prefixIcon: Icon(
          Icons.person,
          color: colors.primary,
        ),
        focusColor: colors.primary,
      ),
    );
  }
}
