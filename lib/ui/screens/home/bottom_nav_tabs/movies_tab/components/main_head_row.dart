import 'package:flutter/material.dart';
import 'package:movie_app_task/core/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class MainHeadRow extends StatelessWidget {
  const MainHeadRow({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
      final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: textTheme.titleLarge!.copyWith(
            fontSize: 20.px,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 30,
          width: 115,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(side: const BorderSide(width: 1.0, color: AppColors.lightGrey)),
              onPressed: onPressed,
              child: Text(
                "See more",
                style: textTheme.labelLarge?.copyWith(color: AppColors.lightGrey),
              )),
        )
      ],
    );
  }
}
