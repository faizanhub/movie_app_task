import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app_task/core/services/get_it.dart';
import 'package:movie_app_task/routes.dart';
import 'package:movie_app_task/ui/custom_theme.dart';
import 'package:movie_app_task/ui/screens/home/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  MyGetIt.setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Film Ku',
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.defaultTheme,
          initialRoute: HomeScreen.routeName,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
