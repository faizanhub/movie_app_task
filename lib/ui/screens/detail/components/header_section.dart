import 'package:flutter/material.dart';
import 'package:movie_app_task/core/constants/colors.dart';
import 'package:movie_app_task/ui/screens/detail/components/genre_chip.dart';
import 'package:movie_app_task/ui/screens/detail/detail_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

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
                  SizedBox(
                    // color: Colors.red,
                    // height: 7.h,
                    width: 80.w,
                    child: Text(
                      vm.movie.title.toString(),
                      maxLines: 2,
                      style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                        fontSize: 22.px,
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                  ),
                  const Icon(
                    Icons.bookmark_border,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.yellow),
                  const SizedBox(width: 5),
                  Text(
                    '${vm.movie.voteAverage!.toStringAsFixed(2)}/10 IMDb',
                    style: const TextStyle(color: AppColors.lightGrey2
                      // fontSize: 22.px,
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    vm.movie.genres!.length,
                        (index) {
                      final item = vm.movie.genres![index];
                      return GenreChip(label: "${item.name}");
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ]
        );
      },
    );
  }
}
