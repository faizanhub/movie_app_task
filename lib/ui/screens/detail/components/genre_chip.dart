import 'package:flutter/material.dart';
import 'package:movie_app_task/core/constants/colors.dart';

class GenreChip extends StatelessWidget {
  final String label;

  GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(color: AppColors.lightSkyBlue, borderRadius: BorderRadius.circular(24)),
      child: Text(
        label,
        style: textTheme.bodySmall?.copyWith(color: AppColors.skyBlueDark),
      ),
    );
    ;
  }
}
