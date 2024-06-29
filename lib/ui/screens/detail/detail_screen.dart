import 'package:flutter/material.dart';
import 'package:movie_app_task/core/constants/colors.dart';
import 'package:movie_app_task/ui/screens/detail/components/body_section.dart';
import 'package:movie_app_task/ui/screens/detail/components/cast_section.dart';
import 'package:movie_app_task/ui/screens/detail/components/header_section.dart';
import 'package:movie_app_task/ui/screens/detail/detail_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details_screen";

  final int movieId;

  const DetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) => DetailScreenVm(context, movieId),
      child: Consumer<DetailScreenVm>(
        builder: (context, vm, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(

                          children: [
                            vm.isYoutubeLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primary,
                                    ),
                                  )
                                :
                            SizedBox(
                              height: 35.h,
                              child: YoutubePlayer(

                                controller: vm.controller,

                                showVideoProgressIndicator: true,
                                progressIndicatorColor: Colors.amber,
                                progressColors: const ProgressBarColors(
                                  playedColor: Colors.amber,
                                  handleColor: Colors.amberAccent,
                                ),
                                onReady: () {
                                  // vm.controller.addListener(listener);
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 40),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Container(
                          // height: 70.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderSection(),
                                BodySection(),
                                CastSection(),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

