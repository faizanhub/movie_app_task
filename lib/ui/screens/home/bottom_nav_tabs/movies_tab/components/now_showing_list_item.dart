import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_task/core/constants/colors.dart';
import 'package:movie_app_task/core/utils/screen_utilities.dart';
import 'package:movie_app_task/ui/screens/detail/detail_screen.dart';
import 'package:movie_app_task/ui/screens/home/home_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NowShowingListItem extends StatelessWidget {
  const NowShowingListItem({super.key});

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
                width: 100.w,
                height: 30.h,
                child: ListView.separated(
                  itemCount: homeVm.upcomingMoviesList.length,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final movie = homeVm.upcomingMoviesList[index];
                    return GestureDetector(
                      onTap: (){
                        debugPrint('movie id is ${movie.id!}');
                        Navigator.pushNamed(context, DetailsScreen.routeName,arguments: movie.id!);

                      },
                      child: SizedBox(
                        width: 30.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20.h,
                              width: 30.w,
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
                                  "https://image.tmdb.org/t/p/original/${movie.posterPath.toString()}",
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            kHeight(1.h),
                             SizedBox(
                               height: 5.h,
                               // color: Colors.red,
                               child: Text(
                                maxLines: 2,
                                movie.title.toString(),
                                overflow: TextOverflow.ellipsis,
                                                         ),
                             ),
                            kHeight(0.5.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.warning,
                                ),
                                kWidth(1.w),
                                Text(
                                  "${movie.voteAverage!.toStringAsFixed(2)}/10 IMDb",
                                  style: textTheme.labelSmall?.copyWith(color: AppColors.lightGrey),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return kWidth(4.w);
                  },
                ),
              );
      },
    );
  }
}
