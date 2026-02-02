import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CazaAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final String? initials;

  const CazaAvatar({
    super.key,
    this.imageUrl,
    this.radius = 24,
    this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primaryBlue,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null && initials != null
          ? Text(
        initials!,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: radius * 0.8,
        ),
      )
          : null,
    );
  }
}