import 'package:flutter/material.dart';
import 'package:movie_app_task/core/constants/colors.dart';
import 'package:movie_app_task/core/utils/screen_utilities.dart';
import 'package:movie_app_task/ui/screens/detail/components/cast_member.dart';
import 'package:movie_app_task/ui/screens/detail/detail_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Consumer<DetailScreenVm>(
      builder: (context, vm, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cast',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                  width: 115,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(side: const BorderSide(width: 1.0, color: AppColors.lightGrey)),
                      onPressed: () {},
                      child: Text(
                        "See more",
                        style: textTheme.labelLarge?.copyWith(color: AppColors.lightGrey),
                      )),
                )
              ],
            ),
            kHeight(3.h),
            SizedBox(
              // color: Colors.green,
              height: 14.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: vm.movie.productionCompanies!.length,
                itemBuilder: (context, index) {
                  final item = vm.movie.productionCompanies![index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.0.sp),
                    child: CastMember(
                      name: '${item.name}',
                      imageUrl: "https://image.tmdb.org/t/p/original/${item.logoPath.toString()}",

                      // imageUrl: placeholderImageUrl,
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
