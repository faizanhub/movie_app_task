import 'package:flutter/foundation.dart';
import 'package:movie_app_task/core/constants/app_configs.dart';
import 'package:movie_app_task/core/enums/status.dart';
import 'package:movie_app_task/core/models/movie_details_response.dart';
import 'package:movie_app_task/core/models/movies_trailer_response.dart';
import 'package:movie_app_task/core/models/popular_movies_response.dart';
import 'package:movie_app_task/core/models/request_response.dart';
import 'package:movie_app_task/core/models/upcoming_movies_response.dart';
import 'package:movie_app_task/core/services/get_it.dart';
import 'package:movie_app_task/core/services/network_service.dart';

abstract class DBBase {
  // Future<RequestResponse> getTimeTableData(BuildContext context);
  Future<RequestResponse> getUpcomingMovies();

  Future<RequestResponse> getPopularMovies();

  Future<RequestResponse> getMovieDetails(int movieId);
}

class DatabaseService extends DBBase {
  @override
  Future<RequestResponse> getUpcomingMovies() async {
    try {
      final networkService = locator.get<NetworkService>();

      String upcomingUrl = '${AppConfigs.baseUrl}${AppConfigs.upcomingMoviesUrl}';

      final body = await networkService.getGetApiResponse(upcomingUrl);

      debugPrint("@Database Service, Get Upcoming Movies => ${body.toString()}");

      UpcomingMoviesResponse upcomingMoviesResponse = UpcomingMoviesResponse.fromJson(body);
      debugPrint("@Database Service, Get Upcoming Movies length => "
          "${upcomingMoviesResponse.results!.length}");

      return RequestResponse(status: Status.success, msg: "Successful", data: upcomingMoviesResponse);


    } catch (ex) {
      debugPrint("@Database Service, Upcoming Movies fetched failed=> ${ex.toString()}");
      rethrow;
    }
  }

  @override
  Future<RequestResponse> getPopularMovies() async {
    try {
      final networkService = locator.get<NetworkService>();

      String popularUrl = '${AppConfigs.baseUrl}${AppConfigs.popularMoviesUrl}';

      final body = await networkService.getGetApiResponse(popularUrl);

      debugPrint("@Database Service, Get Popular Movies => ${body.toString()}");

      PopularMoviesResponse popularMoviesResponse = PopularMoviesResponse.fromJson(body);
      debugPrint("@Database Service, Get Popular Movies length => "
          "${popularMoviesResponse.results!.length}");

      return RequestResponse(status: Status.success, msg: "Successful", data: popularMoviesResponse);


    } catch (ex) {
      debugPrint("@Database Service, Popular Movies fetched failed=> ${ex.toString()}");
      rethrow;
    }
  }

  @override
  Future<RequestResponse> getMovieDetails(int movieId) async {
    try {
      final networkService = locator.get<NetworkService>();

      String movieDetailUrl = '${AppConfigs.baseUrl}${AppConfigs.movieDetailUrl1}$movieId${AppConfigs.movieDetailUrl2}';

      debugPrint('@Db Service => Movie Details Url is $movieDetailUrl');

      final body = await networkService.getGetApiResponse(movieDetailUrl);

      debugPrint("@Database Service, Get Movie Details Url => ${body.toString()}");

      MovieDetailsResponse movieDetailsResponse = MovieDetailsResponse.fromJson(body);
      debugPrint("@Database Service, Get Movie Details Url length => "
          "${movieDetailsResponse.toString()}");

      return RequestResponse(status: Status.success, msg: "Successful", data: movieDetailsResponse);

    } catch (ex) {
      debugPrint("@Database Service, Get Movie Details Url Fetch failed=> ${ex.toString()}");
      rethrow;
    }
  }

  Future<RequestResponse> getMovieTrailer(int movieId) async {
    try {
      final networkService = NetworkService();

      String movieTrailerUrl =
          '${AppConfigs.baseUrl}${AppConfigs.movieTrailerUrl1}$movieId${AppConfigs.movieTrailerUrl2}';

      debugPrint('@Db Service => Movie Trailer Url is $movieTrailerUrl');

      final body = await networkService.getGetApiResponse(movieTrailerUrl);

      debugPrint("@Database Service, Get Movie Trailer Url => ${body.toString()}");

      MovieTrailerResponse movieTrailerResponse = MovieTrailerResponse.fromJson(body);
      debugPrint("@Database Service, Movie Trailer => "
          "${movieTrailerResponse.toString()}");

      return RequestResponse(status: Status.success, msg: "Successful", data: movieTrailerResponse);

    } catch (ex) {
      debugPrint("@Database Service, Movie Trailer fetched failed=> ${ex.toString()}");
      rethrow;
    }
  }
}
