import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_task/core/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CastMember extends StatelessWidget {
  final String name;
  final String imageUrl;

  CastMember({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            width: 80,
            height: 80,
            imageUrl: imageUrl,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),

        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: GoogleFonts.mulish(
            color: AppColors.primary,
            fontWeight: FontWeight.w400,
            fontSize: 12.px,
          ),
        ),
      ],
    );
  }
}
