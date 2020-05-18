import 'package:get_it/get_it.dart';

import 'services/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //locator.registerLazySingleton(() => AuthenticationService());
  //locator.registerLazySingleton(() =>   CourseService());
  locator.registerLazySingleton(() => Api());
  //locator.registerFactory(() => LoginModel());
  //locator.registerFactory(() => HomeModel());
  //locator.registerFactory(() => CourseDetailModel());
}