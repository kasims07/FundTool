import 'package:dio/dio.dart';
import 'package:fundtool_app/screens/loginScreen/repository/login_screen_repository.dart';
import 'package:fundtool_app/screens/loginScreen/repository/login_screen_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../api_client/dio_client.dart';
import '../screens/homeScreen/repository/home_repository.dart';
import '../screens/homeScreen/repository/home_repository_impl.dart';

final GetIt _getIt = GetIt.instance;

void setupDependencies() {
  // Logger
  _getIt.registerSingleton<Logger>(Logger());
  // DIO HTTP Client
  _getIt.registerSingleton<Dio>(DioClient().getDio());

  //social login
  _getIt.registerSingleton<LoginRepository>(LoginRepositoryImpl());
//home screen
  _getIt.registerSingleton<HomeRepository>(HomeRepositoryImpl());
}
