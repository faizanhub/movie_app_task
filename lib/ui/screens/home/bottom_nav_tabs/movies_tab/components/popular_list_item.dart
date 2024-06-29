import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_task/core/constants/colors.dart';
import 'package:movie_app_task/core/utils/screen_utilities.dart';
import 'package:movie_app_task/core/utils/utils.dart';
import 'package:movie_app_task/ui/screens/detail/detail_screen.dart';
import 'package:movie_app_task/ui/screens/home/home_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PopularListItem extends StatelessWidget {
  const PopularListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer<HomeScreenVm>(
      builder: (context, homeVm, child) {
        return homeVm.upcomingIsLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              )
            : SizedBox(
                height: 38.h,
                width: 100.w,
                child: ListView.separated(
                  itemCount: homeVm.popularMoviesList.length,
                    itemBuilder: (context, index) {
                      final movie = homeVm.popularMoviesList[index];

                      return GestureDetector(
                        onTap: (){
                          debugPrint('movie id is ${movie.id!}');
                          Navigator.pushNamed(context, DetailsScreen.routeName,arguments: movie.id!);

                        },
                        child: Row(
                          children: [
                            Container(
                              height: 18.h,
                              width: 26.w,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 4),
                                    color: Colors.grey.shade400,
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade100,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  width: 30.w,
                                  height: 20.h,
                                  imageUrl:
                                      // "https://marketplace.canva.com/EAFvpcP6DrQ/1/0/1131w/canva-green-black-classic-minimalist-fantasy-movie-poster-njyzykFuCug.jpg",
                                  "https://image.tmdb.org/t/p/original/${movie.posterPath.toString()}",                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            kWidth(4.w),
                            SizedBox(
                              height: 18.h,
                              width: 60.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 2,
                                    movie.title.toString(),
                                    style:
                                        textTheme.headlineSmall?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  kHeight(0.5.h),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.warning,
                                      ),
                                      kWidth(1.w),
                                      Text(
                                        "${movie.voteAverage!.toStringAsFixed(2)}/10 IMDb",
                                        style: textTheme.labelSmall?.copyWith(color: AppColors.lightGrey),
                                      )
                                    ],
                                  ),
                                  // kHeight(1.h),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        movie.genreIds!.length,
                                        (index) {
                                          final item = movie.genreIds![index];
                                          return Container(
                                            margin: const EdgeInsets.all(4),
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                            decoration: BoxDecoration(
                                                color: AppColors.lightSkyBlue, borderRadius: BorderRadius.circular(24)),
                                            child: Text(
                                              "${Utils().getGenreName(item)}",
                                              style: textTheme.bodySmall?.copyWith(color: AppColors.skyBlueDark),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                  kHeight(0.5.h),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.watch_later_outlined,
                                        color: AppColors.textColor,
                                      ),
                                      kWidth(1.w),
                                      Text(
                                        "1h 47m",
                                        style: textTheme.labelSmall?.copyWith(color: AppColors.textColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return kHeight(2.h);
                    },
                   ),
              );
      },
    );
  }
}
