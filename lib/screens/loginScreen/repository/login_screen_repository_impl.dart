import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../api_models/api_response.dart';
import '../../../constants/api_constans.dart';
import '../model/login_screen_model.dart';
import 'login_screen_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final _dio = GetIt.I<Dio>();
  @override
  Future<ApiResponse<LoginModel>> login(data) async {
    try {
      final response = await _dio.post(APIConstants.login, data: data);
      final newsResponse = LoginModel.fromJson(response.data);
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
