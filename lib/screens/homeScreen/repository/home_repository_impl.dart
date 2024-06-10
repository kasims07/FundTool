import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fundtool_app/constants/app_constants.dart';
import 'package:fundtool_app/screens/homeScreen/model/home_model.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_models/api_response.dart';
import '../../../constants/api_constans.dart';

import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final _dio = GetIt.I<Dio>();
  @override
  Future<ApiResponse<HomeModel>> home() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final response = await _dio.post(
        APIConstants.homePage,
      );
      final newsResponse = HomeModel.fromJson(response.data);
      String data = jsonEncode(response.data);
      pref.setString(AppConstants.homeData, data);
      return ApiResponse.success(data: newsResponse);
    } on DioException catch (error) {
      print('MYERRORR $error');
      final response = error.response;
      print('RESPONSE_ERRRORR ${error.response}');
      print('RESPONSE_ERRRORR ${response!.data['message']}');
      return ApiResponse.error(errorMsg: response.data['message']);
    }
  }
}
