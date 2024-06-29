import 'package:flutter/material.dart';
import 'package:movie_app_task/core/enums/status.dart';
import 'package:movie_app_task/core/models/movie_details_response.dart';
import 'package:movie_app_task/core/models/movies_trailer_response.dart';
import 'package:movie_app_task/core/services/database_service.dart';
import 'package:movie_app_task/core/services/get_it.dart';
import 'package:movie_app_task/core/utils/utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreenVm with ChangeNotifier {
  late BuildContext context;
  late int movieId;

  late YoutubePlayerController controller;

  DetailScreenVm(this.context, this.movieId) {
    setIsYoutubeLoading(true);

    callAPis();
  }

  callAPis() async {
    getMovieDetails(movieId);
    getMovieTrailer(movieId);
  }

  //
  Future<void> initializeYoutubePlayer() async {
    // setIsChewieLoading(true);
    controller = YoutubePlayerController(

      initialVideoId: trailerKey,
      flags: const YoutubePlayerFlags(

        autoPlay: false,
        mute: false,
        // mute: true,
      ),
    );
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isTrailerLoading = false;

  bool get isTrailerLoading => _isTrailerLoading;

  setIsTrailerLoading(bool value) {
    _isTrailerLoading = value;
    notifyListeners();
  }

  bool _isYoutubeLoading = false;

  bool get isYoutubeLoading => _isYoutubeLoading;

  setIsYoutubeLoading(bool value) {
    _isYoutubeLoading = value;
    notifyListeners();
  }

  late MovieDetailsResponse movie;

  // String trailerLink = 'https://www.youtube.com/watch?v=';
  String trailerKey = '';
  String trailerLink = '';

  void getMovieDetails(int movieId) async {
    setIsLoading(true);

    final dbService = locator.get<DatabaseService>();


    await dbService.getMovieDetails(movieId).then((value) {
      if (value.status == Status.success) {
        setIsLoading(false);

        MovieDetailsResponse movieDetailsResponse = value.data;
        movie = movieDetailsResponse;

        debugPrint("@DetailVm => Data : ${value.msg}");
        notifyListeners();
      }
    }).catchError((err) {
      setIsLoading(false);

      Utils.showFlushBar(context, "Error", err.toString());
    });
  }

  void getMovieTrailer(int movieId) async {
    setIsTrailerLoading(true);

    final dbService = locator.get<DatabaseService>();


    await dbService.getMovieTrailer(movieId).then((value) async {
      if (value.status == Status.success) {
        setIsTrailerLoading(false);

        MovieTrailerResponse movieTrailerResponse = value.data;
        trailerKey = movieTrailerResponse.results![0].key.toString();
        debugPrint('the link before is $trailerLink');

        trailerLink = "https://www.youtube.com/watch?v=$trailerKey";
        debugPrint('the link after is $trailerLink');

        await initializeYoutubePlayer();
        //
        setIsYoutubeLoading(false);

        debugPrint("@DetailVm => Data : ${value.msg}");
        notifyListeners();
      }
    }).catchError((err) {
      setIsYoutubeLoading(false);
      setIsTrailerLoading(false);

      Utils.showFlushBar(context, "Error", err.toString());
    });
  }
}
