import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CazaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary; // New property to switch colors

  const CazaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSecondary ? AppColors.accentRed : AppColors.primaryBlue,
      ),
      child: Text(text),
    );
  }
}