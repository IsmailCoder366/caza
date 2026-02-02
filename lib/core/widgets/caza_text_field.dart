import 'package:flutter/material.dart';

class CazaTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CazaTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        // The styling is mostly handled by the Global Theme we just wrote!
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}