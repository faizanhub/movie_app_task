import 'package:flutter/material.dart';
import 'package:movie_app_task/ui/screens/detail/detail_screen.dart';
import 'package:movie_app_task/ui/screens/home/home_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case DetailsScreen.routeName:
        final args = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => DetailsScreen(movieId: args));

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
