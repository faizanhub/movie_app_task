import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_task/core/utils/screen_utilities.dart';
import 'package:movie_app_task/ui/screens/home/bottom_nav_tabs/movies_tab/components/main_head_row.dart';
import 'package:movie_app_task/ui/screens/home/bottom_nav_tabs/movies_tab/components/now_showing_list_item.dart';
import 'package:movie_app_task/ui/screens/home/bottom_nav_tabs/movies_tab/components/popular_list_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MoviesTab extends StatelessWidget {
  const MoviesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          ///Now Showing Section

      
          MainHeadRow(
              title: "Now Showing",
              onPressed: () {
                // Navigator.pushNamed(context, DetailsScreen.routeName,);
              }),

          kHeight(2.h),

          ///Now Showing
          const NowShowingListItem(),
          kHeight(1.h),

          /// Popular Section
          MainHeadRow(title: "Popular", onPressed: () {}),
          kHeight(2.h),
          const PopularListItem()
        ],
      ),
    );
  }
}
