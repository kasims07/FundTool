import '../../../api_models/api_response.dart';
import '../model/login_screen_model.dart';

abstract class LoginRepository {
  Future<ApiResponse<LoginModel>> login(dynamic data);
}
