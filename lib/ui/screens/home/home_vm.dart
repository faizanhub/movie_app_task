import 'package:flutter/material.dart';
import 'package:movie_app_task/core/enums/status.dart';
import 'package:movie_app_task/core/models/popular_movies_response.dart';
import 'package:movie_app_task/core/models/upcoming_movies_response.dart';
import 'package:movie_app_task/core/services/database_service.dart';
import 'package:movie_app_task/core/services/get_it.dart';
import 'package:movie_app_task/core/utils/utils.dart';

class HomeScreenVm with ChangeNotifier {
  late BuildContext context;

  HomeScreenVm(this.context) {
    getUpcomingMovies();
    getPopularMovies();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  bool _upcomingIsLoading = false;

  bool get upcomingIsLoading => _upcomingIsLoading;

  setUpcomingLoading(bool value) {
    _upcomingIsLoading = value;
    notifyListeners();
  }

  bool _popularIsLoading = false;

  bool get popularIsLoading => _popularIsLoading;

  setPopularLoading(bool value) {
    _popularIsLoading = value;
    notifyListeners();
  }

  List<Results> upcomingMoviesList = [];
  List<Results> popularMoviesList = [];

  void getUpcomingMovies() {

    setUpcomingLoading(true);
    final dbService = locator.get<DatabaseService>();


    dbService.getUpcomingMovies().then((value) {
      if (value.status == Status.success) {
        setUpcomingLoading(false);

        UpcomingMoviesResponse upcomingMoviesResponse = value.data;
        upcomingMoviesList = upcomingMoviesResponse.results!;

        debugPrint("@HomeVm => Data : ${value.msg}");
        notifyListeners();

      }
    }).catchError((err) {

      setUpcomingLoading(false);

      Utils.showFlushBar(context, "Error", err.toString());
    });
  }

  void getPopularMovies() {

    setPopularLoading(true);

    final dbService = locator.get<DatabaseService>();

    dbService.getPopularMovies().then((value) {
      if (value.status == Status.success) {
        setPopularLoading(false);

        PopularMoviesResponse popularMoviesResponse = value.data;
        popularMoviesList = popularMoviesResponse.results!;

        debugPrint("@HomeVm => Popular movies Data : ${value.msg}");
        notifyListeners();

      }
    }).catchError((err) {

      setPopularLoading(false);

      Utils.showFlushBar(context, "Error", err.toString());
    });
  }
}
