

import 'package:get_it/get_it.dart';
import 'package:movie_app_task/core/services/database_service.dart';
import 'package:movie_app_task/core/services/network_service.dart';


final locator = GetIt.instance;

class MyGetIt {

  static void setupLocator() {
    locator.registerLazySingleton(() => NetworkService());
    locator.registerLazySingleton(() => DatabaseService());


  }


}