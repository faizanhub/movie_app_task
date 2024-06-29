import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_task/core/constants/app_assets.dart';
import 'package:movie_app_task/core/utils/screen_utilities.dart';
import 'package:movie_app_task/ui/screens/home/bottom_nav_tabs/movies_tab/movies_tab.dart';
import 'package:movie_app_task/ui/screens/home/home_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;

    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeScreenVm(context),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Consumer<HomeScreenVm>(
            builder: (context, vm, child) {
              return BottomNavigationBar(
                elevation: 8,
                backgroundColor: Colors.white,
                currentIndex: vm.selectedIndex,
                onTap: vm.setSelectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.movie_filter_sharp), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ""),
                ],
              );
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight(3.h),

                ///Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 8.w,
                      height: 8.w,
                      child: SvgPicture.asset(AppAssets.icMenu),
                    ),
                    Text(
                      'FilmKu',
                      style: textTheme.titleLarge!.copyWith(
                        fontSize: 20.px,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                      height: 8.w,
                      child: SvgPicture.asset(AppAssets.icNotification),
                    ),
                  ],
                ),
                kHeight(4.h),
                Consumer<HomeScreenVm>(
                  builder: (context, vm, child) {
                    return Container(
                      // color: Colors.red,
                      width: 100.w,
                      height: 77.h,
                      child: switch(vm.selectedIndex){
                      0 => const MoviesTab(),
                      _ => const SizedBox.shrink()
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
