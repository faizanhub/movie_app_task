import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_task/core/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

abstract class CustomTheme {
  static final ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    textTheme: GoogleFonts.merriweatherTextTheme().copyWith(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 16.px,
        color: AppColors.primary,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10.px,
        color: AppColors.lightGrey,
      ),
    ),
  );
}
