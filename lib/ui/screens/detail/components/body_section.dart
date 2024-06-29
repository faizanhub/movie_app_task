import 'package:flutter/material.dart';
import 'package:movie_app_task/core/constants/colors.dart';
import 'package:movie_app_task/core/utils/utils.dart';
import 'package:movie_app_task/ui/screens/detail/detail_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailScreenVm>(
      builder: (context, vm, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Length',
                      style: TextStyle(color: AppColors.lightGrey2),
                    ),
                    Text(Utils.formatMovieLength(vm.movie.runtime!)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Language',
                      style: TextStyle(color: AppColors.lightGrey2),
                    ),
                    Text(Utils.getLanguageName(vm.movie.originalLanguage!)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rating',
                      style: TextStyle(color: AppColors.lightGrey2),
                    ),
                    Text(vm.movie.adult == true ? 'PG-18' : 'PG-13'),
                  ],
                ),
                const SizedBox(),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18.px,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              vm.movie.overview!,
              // "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
              style: TextStyle(
                fontSize: 14.px,
                height: 1.8,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey2,
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
